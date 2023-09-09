// ignore_for_file: file_names, must_be_immutable, unrelated_type_equality_checks

import 'package:flutter/material.dart';

import '../common/liner_forder/linergrant.dart';
import '../common/simple_dialog/scalffodsnackbar.dart';
import '../firebase_method/loggin_service/resurcese/auth_method.dart';

// class BackendConnection{

//   reset() {
//     if (emailcontroller.text.isEmpty) {
//       Apptools()
//           .shoesnackbar('please inter your Email!', true, context, Colors.red);
//     } else {
//       setState(() {
//         isloding = true;
//       });
//       final res = Authmethods()
//           .resetpassworld(email: emailcontroller.text, context: context);

//       if (res == 'success') {
//         Apptools().dialog(
//             context: context,
//             title:
//                 'the reseting Link was send to your Email please visite your email and reset your passworld!',
//             imageUrl: Gcontainer().networkimage());
//         setState(() {
//           isloding = true;
//         });
//       } else {
//         setState(() {
//           isloding = false;
//         });
//       }
//     }
//   }

// }

class ForgetConnet extends StatefulWidget {
  final TextEditingController emailcontroller;
  bool isweb = false;
  bool isloding;
  ForgetConnet(
      {super.key,
      required this.emailcontroller,
      required this.isloding,
      required this.isweb});

  @override
  State<ForgetConnet> createState() => _ForgetConnetState();
}

class _ForgetConnetState extends State<ForgetConnet> {
  void reset() {
    if (widget.emailcontroller.text.isEmpty) {
      Apptools()
          .shoesnackbar('please inter your Email!', true, context, Colors.red);
    } else {
      setState(() {
        widget.isloding = true;
      });
      Future res = Authmethods()
          .resetpassworld(email: widget.emailcontroller.text, context: context);

      if (res == 'success') {
        Apptools().dialog(
            context: context,
            title:
                'the reseting Link was send to your Email please visite your email and reset your passworld!',
            imageUrl: Gcontainer().networkimage());
        setState(() {
          widget.isloding = true;
        });
      } else {
        setState(() {
          widget.isloding = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: reset,
      child: Container(
        width: !widget.isweb ? double.infinity : 300,
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(15),
            gradient: Gcontainer().buttonLinear()),
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Center(
            child: !widget.isloding
                ? const Text('Reset Password ->')
                : const CircularProgressIndicator(color: Colors.white)),
      ),
    );
  }
}
