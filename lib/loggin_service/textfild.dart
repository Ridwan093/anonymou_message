import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  final bool isobs;
  final TextEditingController textEditingController;
  final String hintText;
  final TextInputType keyboardType;

  const Textfield(
      {Key? key,
      required this.hintText,
      this.isobs = false,
      required this.textEditingController,
      required this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      strutStyle:
          StrutStyle.fromTextStyle(const TextStyle(color: Colors.white)),
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white54),
      keyboardType: keyboardType,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white30),
          helperStyle: const TextStyle(color: Colors.white),
          contentPadding: const EdgeInsets.all(8)),
      obscureText: isobs,
      controller: textEditingController,
    );
  }
}
