import 'package:flutter/material.dart';

class CustomiseField extends StatelessWidget {
  final TextInputType keyboardType;
  final String hintText;
  final int maxLines;
  final int maxLength;
  final TextEditingController controller;
  final bool iscont;
  const CustomiseField(
      {super.key,
      required this.keyboardType,
      required this.hintText,
      required this.maxLines,
      required this.maxLength,
      required this.controller,
      required this.iscont});

  @override
  Widget build(BuildContext context) {
    return TextField(
      strutStyle: StrutStyle.fromTextStyle(
          const TextStyle(fontSize: 20, color: Colors.white)),
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white54),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.white30,
        ),
        helperStyle: const TextStyle(
          color: Colors.white,
        ),
        contentPadding: const EdgeInsets.all(8),
      ),
      maxLines: iscont ? maxLines : 0,
      maxLength: maxLength,
      controller: controller,
    );
  }
}
