import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, required this.hint, this.onChanged});
  final String? hint;

  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.white),
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint ?? " ",
        hintStyle: TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.cyanAccent),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
