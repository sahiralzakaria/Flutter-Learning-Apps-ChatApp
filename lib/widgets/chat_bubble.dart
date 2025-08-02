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
        margin: EdgeInsets.only(left: 12, right: 12, bottom: 10),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        // constraints: BoxConstraints(
        //   maxWidth: MediaQuery.of(context).size.width * 0.7,
        //   minHeight: 50,
        //   minWidth: 60,
        // ),
        decoration: BoxDecoration(
          color: leftBubble ? kPrimaryColor : kSecondColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(leftBubble ? 20 : 0),
            bottomLeft: Radius.circular(leftBubble ? 0 : 20),
          ),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: leftBubble ? Colors.white : Colors.black,

            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
