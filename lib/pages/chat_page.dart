import 'package:flutter/material.dart';
import 'package:simplechatapp/constants.dart';
import 'package:simplechatapp/models/message.dart';
import 'package:simplechatapp/widgets/chat_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  static String id = 'ChatPage';
  final _controller = ScrollController();

  CollectionReference messages = FirebaseFirestore.instance.collection(
    'messages',
  );

  TextEditingController controller = TextEditingController();

  void sendMessage(String emailShort) {
    if (controller.text.trim().isNotEmpty) {
      messages.add({
        'message': controller.text,
        'createdAt': DateTime.now(),
        'id': emailShort,
      });
      controller.clear();

      _controller.animateTo(
        0,
        curve: Curves.fastOutSlowIn,
        duration: Duration(milliseconds: 300),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final String emailShort =
        ModalRoute.of(context)!.settings.arguments as String;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy('createdAt', descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messagesList = [];

          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
          }

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
                SizedBox(height: 15),
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: _controller,
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      return messagesList[index].id == emailShort
                          ? ChatBubble(
                              leftBubble: true,
                              message: messagesList[index].message,
                            )
                          : ChatBubble(
                              leftBubble: false,
                              message: messagesList[index].message,
                            );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: controller,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hint: Text('Send your message'),
                      suffixIcon: GestureDetector(
                        onTap: () => sendMessage(emailShort),
                        child: Icon(Icons.send, color: kPrimaryColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: kSecondColor, width: 2),
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
