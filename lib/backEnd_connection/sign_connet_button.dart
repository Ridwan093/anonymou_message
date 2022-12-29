import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../UI_screen/userInfo/userprofile.dart';
import '../common/liner_forder/linergrant.dart';
import '../common/simple_dialog/scalffodsnackbar.dart';
import '../firebase_method/loggin_service/resurcese/auth_method.dart';
import '../firebase_method/loggin_service/validation_property/validator_service.dart';

class SignButton extends StatefulWidget {
  final TextEditingController passcontroller;
  final TextEditingController emailcontroller;
  final TextEditingController namecontroller;
  final FocusNode node;
  String username;
  bool isweb = false;
  bool isloding;

  SignButton(
      {super.key,
      required this.passcontroller,
      required this.emailcontroller,
      required this.namecontroller,
      required this.username,
      required this.isloding,
      required this.node,
      required this.isweb});

  @override
  State<SignButton> createState() => _SignButtonState();
}

class _SignButtonState extends State<SignButton> {
  void getusername() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
      widget.username = (snapshot.data() as Map<String, dynamic>)['userName'];
    });
  }

  siginuser() async {
    if (widget.passcontroller.text.isEmpty ||
        widget.emailcontroller.text.isEmpty ||
        widget.namecontroller.text.isEmpty) {
      Apptools()
          .shoesnackbar('fill all the feilds!', true, context, Colors.red);
    } else {
      // ignore: unrelated_type_equality_checks
      if (widget.namecontroller.text.length <= 3) {
        Apptools().shoesnackbar(
            'Must be at least 3 characters!', true, context, Colors.red);
      } else {
        deletespace();

        // Apptools().shoesnackbar('this username is not  alredy been use please!',
        //     true, context, Colors.green);
        setState(() {
          widget.isloding = true;
        });
        deletespace();
        String res = await Authmethods().signUser(
            userName: widget.namecontroller.text,
            password: widget.passcontroller.text,
            email: widget.emailcontroller.text,
            context: context);

        setState(() {
          widget.isloding = false;
          widget.namecontroller.text = '';
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
  }

  @override
  void initState() {
    super.initState();
    widget.node.addListener(() {
      if (!widget.node.hasFocus) {
        deletespace();
      }
    });
  }

  void deletespace() {
    widget.emailcontroller.text =
        widget.emailcontroller.text.replaceAll(r'\s', r'\s');
    widget.passcontroller.text =
        widget.passcontroller.text.replaceAll(r'\s', r'\s');
    widget.namecontroller.text =
        widget.namecontroller.text.replaceAll(r'\s', r'\s');
  }

  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<SignupValidation>(context);
    return GestureDetector(
      onTap: !(validationService.isValid) ? null : siginuser,
      child: Container(
        width: !widget.isweb ? double.infinity : 300,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(15),
            gradient: !(validationService.isValid)
                ? Gcontainer().errorcontainer()
                : Gcontainer().buttonLinear()),
        child: widget.isloding
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : const Center(
                child: Text(
                'Regester Account ->',
                style: TextStyle(color: Colors.white),
              )),
      ),
    );
  }
}
