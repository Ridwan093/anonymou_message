import 'package:anonymouse_messages/UI_screen/auth_layout/sign_up.dart';
import 'package:anonymouse_messages/common/liner_forder/linergrant.dart';
import 'package:anonymouse_messages/firebase_method/loggin_service/resurcese/auth_method.dart';
import 'package:anonymouse_messages/common/simple_dialog/scalffodsnackbar.dart';

import 'package:anonymouse_messages/firebase_method/loggin_service/textfild.dart';

import 'package:anonymouse_messages/web/Ul_screen/web_auth_screen/web_login.dart';
import 'package:anonymouse_messages/web/Ul_screen/webprofile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

import '../../../backEnd_connection/sign_connet_button.dart';
import '../../../firebase_method/loggin_service/validation_property/validation_formfield.dart';
import '../../../firebase_method/loggin_service/validation_property/validator_service.dart';
import '../../../UI_screen/message_layout/sendMessage_screen/writing_post.dart';
import '../../../common/simple_dialog/alertDialoge.dart';

class WebSignin extends StatefulWidget {
  const WebSignin({Key? key}) : super(key: key);

  @override
  State<WebSignin> createState() => _WebSigninState();
}

final TextEditingController useremailcontroller = TextEditingController();
final TextEditingController userpasscontroller = TextEditingController();
final TextEditingController usernamecontroller = TextEditingController();
bool _isloding = false;

class _WebSigninState extends State<WebSignin> {
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
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Writingpost()));
            }
          });
    }
    setState(() {
      islodinOTP = true;
    });
  }

  bool _islodin = false;

  final _formKey = GlobalKey<FormState>();
  String username = '';

  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<SignupValidation>(context);
    ToastContext().init(context);
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
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
                          padding: const EdgeInsets.only(
                              left: 40, right: 40, top: 20),
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
                                  'Regester!',
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
                                  height: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    islodincontainer
                                        ? const Text(
                                            "now it's your turn to creste an account and dare"
                                            " your friends to tell you what they think about you",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Color.fromARGB(
                                                    255, 26, 206, 32)),
                                          )
                                        : Container(),
                                    const SizedBox(),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        top: 10,
                                      ),
                                      child: Text(
                                        'Your UserName',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white30,
                                        ),
                                      ),
                                    ),
                                    Validationform(
                                        namecontroller: namecontroller,
                                        islodin: !_islodin),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Your Email',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white30,
                                      ),
                                    ),
                                    Textfield(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        hintText: 'Enter Your Email',
                                        isobs: false,
                                        textEditingController:
                                            useremailcontroller),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Password',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white30,
                                      ),
                                    ),
                                    Textfield(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        hintText: 'Enter Your password',
                                        isobs: true,
                                        textEditingController:
                                            userpasscontroller),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                SignButton(
                                    passcontroller: userpasscontroller,
                                    emailcontroller: useremailcontroller,
                                    namecontroller: useremailcontroller,
                                    username: username,
                                    isloding: _isloding,
                                    isweb: false,
                                    node: node),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Alredy Have an Account?',
                                      style: TextStyle(color: Colors.white30),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        // Toast.show("Toast plugin app",
                                        //     webShowClose: true,
                                        //     backgroundColor:
                                        //         const Color(0xAA000000),
                                        //     duration: Toast.lengthShort,
                                        //     gravity: Toast.center);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const WebLoggin()));
                                      },
                                      child: const Text(
                                        'Sign in',
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    )
                                  ],
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
      ),
    );
  }
}
