import 'package:flutter/material.dart';
import 'package:simplechatapp/constants.dart';
import 'package:simplechatapp/models/message.dart';
import 'package:simplechatapp/widgets/chat_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  static String id = 'ChatPage';
  final ScrollController _scrollController = ScrollController();

  CollectionReference messages = FirebaseFirestore.instance.collection(
    'messages',
  );

  TextEditingController controller = TextEditingController();

  // دالة للانتقال إلى آخر الصفحة
  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy('createdAt').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messagesList = [];

          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
          }

          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (_scrollController.hasClients) {
              _scrollController.animateTo(
                _scrollController.position.maxScrollExtent,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            }
          });

          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: kPrimaryColor,
              iconTheme: IconThemeData(color: Colors.white),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(kLogo, height: 40),
                  Text('Chat App', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            body: Column(
              children: [
                SizedBox(height: 20),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: messagesList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: ChatBubble(
                            leftBubble: true,
                            message: messagesList[index].message,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(color: kPrimaryColor),
                  child: SafeArea(
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controller,
                            onSubmitted: (value) async {
                              if (value.trim().isNotEmpty) {
                                await messages.add({
                                  'message': value.trim(),
                                  'createdAt': DateTime.now(),
                                });

                                controller.clear();

                                _scrollToBottom();
                              }
                            },
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: 'Send your message',
                              hintStyle: TextStyle(color: Colors.white),
                              suffixIcon: GestureDetector(
                                onTap: () async {
                                  String value = controller.text;
                                  if (value.trim().isNotEmpty) {
                                    await messages.add({
                                      'message': value.trim(),
                                      'createdAt': DateTime.now(),
                                    });
                                    controller.clear();
                                    _scrollToBottom();
                                  }
                                },
                                child: Icon(Icons.send, color: kSecondColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide(
                                  color: kSecondColor,
                                  width: 2,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide(color: kPrimaryColor),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 12,
                              ),
                            ),
                            maxLines: null,
                            textInputAction: TextInputAction.send,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: kPrimaryColor),
            ),
          );
        }
      },
    );
  }
}




// SizedBox(height: 30),

//           ChatBubble(leftBubble: true, message: 'Hey there! Long time no see!'),

//           ChatBubble(
//             leftBubble: false,
//             message: 'Hey! Yeah, it’s been a while. How have you been?',
//           ),

//           ChatBubble(
//             leftBubble: true,
//             message: 'I’m good, just busy with work. What about you?',
//           ),

//           ChatBubble(
//             leftBubble: false,
//             message: 'Same here. Life’s been hectic lately.',
//           ),

//           ChatBubble(
//             leftBubble: true,
//             message: 'I get that. We should catch up sometime soon.',
//           ),

//           ChatBubble(
//             leftBubble: false,
//             message: 'Totally! Maybe this weekend?',
//           ),

//           ChatBubble(leftBubble: true, message: 'Sounds perfect. Let’s do it!'),

//           ChatBubble(
//             leftBubble: false,
//             message: 'Great! I’ll text you the details later.',
//           ),