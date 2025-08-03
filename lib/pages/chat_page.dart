import 'package:flutter/material.dart';
import 'package:simplechatapp/constants.dart';
import 'package:simplechatapp/models/message.dart';
import 'package:simplechatapp/widgets/chat_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  static String id = 'ChatPage';
  CollectionReference messages = FirebaseFirestore.instance.collection(
    'messages',
  );

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: messages.snapshots(),
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
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      return ChatBubble(
                        leftBubble: true,
                        message: messagesList[index].message,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: controller,
                    onSubmitted: (value) {
                      messages.add({'message': value});
                      controller.clear();
                    },
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hint: Text('Send your message'),
                      suffixIcon: Icon(Icons.send, color: kPrimaryColor),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kSecondColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: kPrimaryColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Text('data');
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