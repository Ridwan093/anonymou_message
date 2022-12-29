import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../UI_screen/userInfo/userprofile.dart';

class UsernmaeTextfield extends StatelessWidget {
  final bool isobs;
  final TextEditingController textEditingController;
  final String hintText;
  final TextInputType keyboardType;

  const UsernmaeTextfield(
      {Key? key,
      required this.hintText,
      this.isobs = false,
      required this.textEditingController,
      required this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        key: const ValueKey('user'),
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
        validator: (value) => Valid(value));
  }
}

// ignore: non_constant_identifier_names
Valid(String? value) async {
  final QuerySnapshot result = await FirebaseFirestore.instance
      .collection('user')
      .where('userName', isEqualTo: namecontroler.text)
      .get();
  final List<QueryDocumentSnapshot> doc = result.docs;
  if (value!.isEmpty || value.length < 3) {
    return 'please Enter a valid user name';
  } else if (doc.isEmpty) {
    return 'this User name Alredy exiest';
  }
}
