import 'package:flutter/material.dart';
import 'package:simplechatapp/constants.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.leftBubble,
    required this.message,
  });

  final bool leftBubble;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: leftBubble ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
          minHeight: 40,
        ),
        decoration: BoxDecoration(
          color: leftBubble ? kPrimaryColor : kSecondColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomRight: Radius.circular(leftBubble ? 25 : 0),
            bottomLeft: Radius.circular(leftBubble ? 0 : 25),
          ),
        ),
        child: Text(
          message,
          style: TextStyle(color: Colors.white, fontSize: 15),
          textAlign: leftBubble ? TextAlign.left : TextAlign.right,
        ),
      ),
    );
  }
}
