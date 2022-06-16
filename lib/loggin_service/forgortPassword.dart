// ignore_for_file: unrelated_type_equality_checks

import 'package:anonymouse_messages/loggin_service/resurcese/auth_method.dart';
import 'package:anonymouse_messages/loggin_service/resurcese/scalffodsnackbar.dart';

import 'package:anonymouse_messages/loggin_service/textfild.dart';
import 'package:flutter/material.dart';

import 'linergrant.dart';

class Forgotingpass extends StatefulWidget {
  const Forgotingpass({Key? key}) : super(key: key);

  @override
  State<Forgotingpass> createState() => _ForgotingpassState();
}

bool isloding = false;
// ignore: prefer_typing_uninitialized_variables

final TextEditingController emailcontroller = TextEditingController();

class _ForgotingpassState extends State<Forgotingpass> {
  reset() {
    if (emailcontroller.text.isEmpty) {
      Apptools()
          .shoesnackbar('please inter your Email!', true, context, Colors.red);
    } else {
      setState(() {
        isloding = true;
      });
      final res = Authmethods()
          .resetpassworld(email: emailcontroller.text, context: context);

      if (res == 'success') {
        Apptools().dialog(
            context: context,
            title:
                'the reseting Link was send to your Email please visite your email and reset your passworld!',
            imageUrl: Gcontainer().networkimage());
        setState(() {
          isloding = true;
        });
      } else {
        setState(() {
          isloding = false;
        });
      }
    }
  }

  FocusNode node = FocusNode();
  @override
  void initState() {
    super.initState();
    node.addListener(() {
      if (!node.hasFocus) {
        deletespace();
      }
    });
  }

  void deletespace() {
    emailcontroller.text = emailcontroller.text.replaceAll("", "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            decoration: BoxDecoration(
                color: Colors.blue, gradient: Gcontainer().lineargrant()),
            child: Stack(
              children: [
                Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 22, 0, 27),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: const EdgeInsets.only(
                      left: 15, right: 15, top: 30, bottom: 20),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            CircleAvatar(
                              backgroundImage:
                                  NetworkImage(Gcontainer().networkimage()),
                              radius: 50,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Forgot Password!',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              " Forgot your password? Don't worry! Reset it here.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white30,
                              ),
                            ),
                            const SizedBox(
                              height: 22,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Your Email',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white30,
                                  ),
                                ),
                                Textfield(
                                    keyboardType: TextInputType.emailAddress,
                                    hintText: 'Enter Your Email',
                                    isobs: false,
                                    textEditingController: emailcontroller),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            GestureDetector(
                              onTap: reset,
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(15),
                                    gradient: Gcontainer().buttonLinear()),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                child: Center(
                                    child: !isloding
                                        ? const Text('Reset Password ->')
                                        : const CircularProgressIndicator(
                                            color: Colors.white)),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 1.9,
                              color: const Color.fromARGB(255, 166, 76, 182),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(15),
                                    gradient: Gcontainer().buttonLinear()),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                child: const Center(child: Text('Go Back  <-')),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Remembered the password? ',
                                  style: TextStyle(color: Colors.white30),
                                ),
                                InkWell(
                                  onTap: () {
                                    Apptools().dialog(
                                        context: context,
                                        title:
                                            'the reseting Link was send to your Email please visite your email and reset your passworld ! 💌💌💌',
                                        imageUrl: Gcontainer().networkimage());
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             const Loggin()));
                                  },
                                  child: const Text(
                                    ' Login',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ]),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
