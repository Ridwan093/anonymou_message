import 'dart:developer';

import 'package:anonymouse_messages/loggin_service/resurcese/auth_method.dart';
import 'package:anonymouse_messages/loggin_service/resurcese/scalffodsnackbar.dart';
import 'package:anonymouse_messages/loggin_service/sign_up.dart';
import 'package:anonymouse_messages/loggin_service/textfild.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import '../message_properties/writing_post.dart';
import '../simple_dialog/alertDialoge.dart';
import '../userInfo/userprofile.dart';

import '../web/web_auth_methode/web_regester.dart';
import 'forgortPassword.dart';
import 'linergrant.dart';

class Loggin extends StatefulWidget {
  const Loggin({Key? key}) : super(key: key);

  @override
  State<Loggin> createState() => _LogginState();
}

final TextEditingController emailcontroller = TextEditingController();
final TextEditingController passcontroller = TextEditingController();
bool _isloding = false;
// ignore: prefer_typing_uninitialized_variables

String? errormessages;

class _LogginState extends State<Loggin> {
  void login(BuildContext context) async {
    if (passcontroller.text.isEmpty || emailcontroller.text.isEmpty) {
      setState(() {
        errormessages = 'fill all the feilds!';
      });
      Apptools()
          .shoesnackbar('fill all the feilds!', true, context, Colors.red);
    } else {
      setState(() {
        _isloding = true;
      });
      String res = await Authmethods().login(
          password: passcontroller.text,
          email: emailcontroller.text,
          context: context);
      deletespace();
      log(res);

      setState(() {
        _isloding = false;
        usernamecontroller.text = '';
        emailcontroller.text = '';
        passcontroller.text = '';
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

  FocusNode focusnode = FocusNode();

  @override
  void initState() {
    super.initState();
    initDynamicLinks();
    focusnode.addListener(() {
      if (!focusnode.hasFocus) {
        deletespace();
      }
    });
  }

  void deletespace() {
    emailcontroller.text = emailcontroller.text.replaceAll("", "");
    passcontroller.text = passcontroller.text.replaceAll("", "");
  }

  initDynamicLinks() async {
    // this is called when app comes from background
    FirebaseDynamicLinks.instance.onLink;

    // this is called when app is not open in background

    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;

    if (deepLink != null) {
      AlaertDb().dialog(
          context: context,
          controller: namecontroler,
          ontap: () {
            if (namecontroler.text.isEmpty) {
              Apptools().shoesnackbar(
                  'insert Your Friend Name', true, context, Colors.red);
            } else {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Writingpost()));
            }
          });
    }
    setState(() {
      islodinOTP = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
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
                              'Login!',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Recieve anonymous compliments from your friend and send anonymous messages to your friend for free.',
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
                                    textEditingController: emailcontroller),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  'Password',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white30,
                                  ),
                                ),
                                Textfield(
                                    keyboardType: TextInputType.emailAddress,
                                    hintText: 'Enter Your password',
                                    isobs: true,
                                    textEditingController: passcontroller),
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            GestureDetector(
                              onTap: () {
                                login(context);
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             const Writingpost()));
                              },
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(15),
                                    gradient: Gcontainer().buttonLinear()),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                child: _isloding
                                    ? const Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      )
                                    : const Center(child: Text('Login ->')),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Don't Have an Account?",
                                  style: TextStyle(color: Colors.white30),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Signup()));
                                  },
                                  child: const Text(
                                    ' Sign up',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Forgotingpass()));
                              },
                              child: const Text(
                                'Forgot Password',
                                style: TextStyle(color: Colors.white30),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Gcontainer().terms(),
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
