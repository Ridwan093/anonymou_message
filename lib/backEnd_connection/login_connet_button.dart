// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';

import '../UI_screen/userInfo/userprofile.dart';
import '../common/liner_forder/linergrant.dart';
import '../common/simple_dialog/scalffodsnackbar.dart';
import '../firebase_method/loggin_service/resurcese/auth_method.dart';

class LoginButton extends StatefulWidget {
  final TextEditingController emailcontroller;
  final TextEditingController passcontroller;
  final FocusNode focusnode;
  bool isweb = false;
  bool isloding;
  LoginButton(
      {super.key,
      required this.emailcontroller,
      required this.passcontroller,
      required this.isloding,
      required this.focusnode,
      required this.isweb});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  void login(BuildContext context) async {
    if (widget.passcontroller.text.isEmpty ||
        widget.emailcontroller.text.isEmpty) {
      Apptools()
          .shoesnackbar('fill all the feilds!', true, context, Colors.red);
    } else {
      setState(() {
        widget.isloding = true;
      });
      String res = await Authmethods().login(
          password: widget.passcontroller.text,
          email: widget.emailcontroller.text,
          context: context);
      deletespace();
      log(res);

      setState(() {
        widget.isloding = false;

        widget.emailcontroller.text = '';
        widget.passcontroller.text = '';
      });
      if (res == 'success') {
        Apptools().shoesnackbar('success!', false, context, Colors.green);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const Userprofile()));
      } else {
        Apptools().shoesnackbar(res, true, context, Colors.red);
      }
    }
  }

  @override
  void initState() {
    super.initState();

    widget.focusnode.addListener(() {
      if (!widget.focusnode.hasFocus) {
        deletespace();
      }
    });
  }

  void deletespace() {
    widget.emailcontroller.text =
        widget.emailcontroller.text.replaceAll("", "");
    widget.passcontroller.text = widget.passcontroller.text.replaceAll("", "");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        login(context);
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) =>
        //             const Writingpost()));
      },
      child: Container(
        width: !widget.isweb ? double.infinity : 300,
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(15),
            gradient: Gcontainer().buttonLinear()),
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: widget.isloding
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : const Center(child: Text('Login ->')),
      ),
    );
  }
}
