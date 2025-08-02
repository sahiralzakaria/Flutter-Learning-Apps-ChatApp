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

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ChatBubble(leftBubble: true, message: 'message');
              },
            ),
          ),
          Padding(padding: const EdgeInsets.all(16), child: TextField()),
        ],
      ),
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