import 'package:flutter/material.dart';

class CustomButon extends StatelessWidget {
  CustomButon({super.key, this.onTap, required this.color, required this.text});
  final Color color;
  final String text;

  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        height: 60,
        child: Center(child: Text(text, style: TextStyle(fontSize: 18))),
      ),
    );
  }
}
