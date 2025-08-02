import 'package:flutter/material.dart';
import 'package:simplechatapp/constants.dart';
import 'package:simplechatapp/widgets/chat_bubble.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  static String id = 'ChatPage';

  @override
  Widget build(BuildContext context) {
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

      body: ListView(
        children: [
          ChatBubble(leftBubble: true, message: 'Hello'),
          ChatBubble(leftBubble: false, message: 'Hi'),
          ChatBubble(leftBubble: true, message: 'How are you'),
          ChatBubble(leftBubble: false, message: 'I am fine and you ? '),
          ChatBubble(leftBubble: true, message: 'welcome'),
          ChatBubble(leftBubble: false, message: 'go from here'),
          ChatBubble(leftBubble: true, message: 'why?'),
          ChatBubble(leftBubble: false, message: 'I am tired'),
        ],
      ),
    );
  }
}
