import 'package:anonymouse_messages/loggin_service/linergrant.dart';
import 'package:anonymouse_messages/loggin_service/resurcese/auth_method.dart';
import 'package:anonymouse_messages/loggin_service/resurcese/scalffodsnackbar.dart';
import 'package:anonymouse_messages/loggin_service/sign_up.dart';
import 'package:anonymouse_messages/loggin_service/textfild.dart';
import 'package:anonymouse_messages/web/web_auth_methode/web_forgort.dart';
import 'package:anonymouse_messages/web/web_auth_methode/web_regester.dart';
import 'package:anonymouse_messages/web/web_post_mesage/writting_message.dart';
import 'package:anonymouse_messages/web/webprofile.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import '../../message_properties/writing_post.dart';
import '../../simple_dialog/alertDialoge.dart';
import 'package:anonymouse_messages/loggin_service/forgortPassword.dart';

class WebLoggin extends StatefulWidget {
  const WebLoggin({Key? key}) : super(key: key);

  @override
  State<WebLoggin> createState() => _WebLogginState();
}

final TextEditingController emailcontroller = TextEditingController();
final TextEditingController passcontroller = TextEditingController();
bool _isloding = false;

class _WebLogginState extends State<WebLoggin> {
  void login(BuildContext context) async {
    if (passcontroller.text.isEmpty || emailcontroller.text.isEmpty) {
      Apptools().toast('fill all the feilds!', context, Colors.red);
    } else {
      setState(() {
        _isloding = true;
      });

      String res = await Authmethods().weblogin(
          password: passcontroller.text,
          email: emailcontroller.text,
          context: context);

      print(res);

      setState(() {
        _isloding = false;

        emailcontroller.text = '';
        passcontroller.text = '';
      });
      if (res == 'success') {
        Apptools().toast('success!', context, Colors.green);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const Webprofile()));
      } else {
        Apptools().toast(res, context, Colors.red);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    initDynamicLinks();
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
              Apptools().toast('insert Your Friend Name', context, Colors.red);
            } else {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Web_post_message()));
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
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.blue, gradient: Gcontainer().lineargrant()),
            child: Stack(
              children: [
                Center(
                  child: Container(
                    height: 600,
                    width: 700,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 22, 0, 27),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: const EdgeInsets.only(
                        left: 15, right: 15, top: 30, bottom: 20),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 40, right: 40, top: 20),
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
                                      isobs: false,
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
                                  width: 300,
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
                                                  const WebSignin()));
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
                                              const Webforgetpass()));
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
                  ),
                )
              ],
            )),
      ),
    );
  }
}
