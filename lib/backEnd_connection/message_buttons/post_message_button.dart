// ignore_for_file: use_build_context_synchronously, must_be_immutable, duplicate_ignore

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../UI_screen/auth_layout/sign_up.dart';
import '../../UI_screen/message_layout/sendMessage_screen/writing_post.dart';
import '../../UI_screen/userInfo/userprofile.dart';
import '../../common/liner_forder/linergrant.dart';
import '../../common/simple_dialog/scalffodsnackbar.dart';
import '../../firebase_method/message_method/Db_helper/DatabaseHelper.dart';

class PostMessageButton extends StatefulWidget {
  final TextEditingController messagecontroller;
  bool isloding;
  PostMessageButton(
      {super.key, required this.messagecontroller, required this.isloding});

  @override
  State<PostMessageButton> createState() => _PostMessageButtonState();
}

class _PostMessageButtonState extends State<PostMessageButton> {
  // DbHelper db = DbHelper().res as DbHelper;
  _uploadTask(BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (widget.messagecontroller.text.isEmpty) {
      Apptools()
          .shoesnackbar('please insert some text!', true, context, Colors.red);
    } else {
      setState(() {
        widget.isloding = true;
      });

      String res = await DbHelper().postmessageToDatabase(
          message: widget.messagecontroller.text, username: namecontroler.text);

      log(widget.messagecontroller.text.toString());
      setState(() {
        widget.isloding = false;
        islodincontainer = false;
      });
      if (res == 'success') {
        // ignore: use_build_context_synchronously
        Apptools()
            .shoesnackbar('success 😜😜😜😜', false, context, Colors.green);
      } else {
        Apptools().shoesnackbar(res.toString(), true, context, Colors.red);
      }

      messagecontroller.text = '';

      if (auth.currentUser?.uid == null) {
        
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Signup()));
        setState(() {
          islodincontainer = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _uploadTask(context),
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(15),
              gradient: Gcontainer().buttonLinear()),
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Center(
              child: !isloding
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Send Message  '),
                        FaIcon(
                          Icons.send,
                          size: 10,
                        )
                      ],
                    )
                  : const CircularProgressIndicator())),
    );
  }
}
