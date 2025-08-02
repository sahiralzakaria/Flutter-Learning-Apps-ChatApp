import 'package:flutter/material.dart';
import 'package:simplechatapp/constants.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.only(left: 16),
      height: 65,
      width: 150,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Center(
        child: Text(
          'Merhaba I am ',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }
}
