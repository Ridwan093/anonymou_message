import 'package:anonymouse_messages/loggin_service/logging.dart';
import 'package:anonymouse_messages/loggin_service/resurcese/auth_method.dart';
import 'package:anonymouse_messages/loggin_service/resurcese/scalffodsnackbar.dart';
import 'package:anonymouse_messages/loggin_service/textfild.dart';
import 'package:anonymouse_messages/message_properties/writing_post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';
import 'package:provider/provider.dart';

import '../userInfo/userprofile.dart';
import '../validation_property/validator_service.dart';
import 'linergrant.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

final TextEditingController emailcontroller = TextEditingController();
final TextEditingController passcontroller = TextEditingController();
final TextEditingController namecontroller = TextEditingController();
bool _isloding = false;
FocusNode node = FocusNode();

class _SignupState extends State<Signup> {
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
    emailcontroller.text = emailcontroller.text.replaceAll(r'\s', r'\s');
    passcontroller.text = passcontroller.text.replaceAll(r'\s', r'\s');
    namecontroller.text = namecontroller.text.replaceAll(r'\s', r'\s');
  }

  final bool _isiconloding = false;
  Widget playContainer() {
    return Positioned(
      top: 80,
      left: 10,
      right: 10,
      child: islodincontainer
          ? Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              height: 150,
              color: const Color.fromARGB(255, 255, 224, 129),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'How to play?',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 88, 73, 25)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      height: 1.9,
                      color: const Color.fromARGB(255, 166, 76, 182),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '-> Regester your Account NOW!👇👇👇',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 26, 206, 32)),
                    ),
                    const Text(
                      '-> shear your dere Link with others',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 26, 206, 32)),
                    ),
                    const Text(
                      "-> Recieve anonymous compliments and '",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 26, 206, 32)),
                    ),
                    const Text(
                      " secreet messages from your friends'",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 26, 206, 32)),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12, right: 10),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 209, 32, 19),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2.0,
                                  blurRadius: 3.0,
                                  color: Colors.cyan)
                            ]),
                        height: 36,
                        width: 36,
                        child: Center(
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  islodincontainer = false;
                                });
                              },
                              icon: const Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 20,
                              )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          : Container(),
    );
  }

  String username = '';
  // @override
  // void dispose() {
  //   super.dispose();
  //   emailcontroller.dispose();
  //   namecontroller.dispose();
  //   passcontroller.dispose();
  // }

  void getusername() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
      username = (snapshot.data() as Map<String, dynamic>)['userName'];
    });
  }

  siginuser() async {
    if (passcontroller.text.isEmpty ||
        emailcontroller.text.isEmpty ||
        namecontroller.text.isEmpty) {
      Apptools()
          .shoesnackbar('fill all the feilds!', true, context, Colors.red);
    } else {
      // ignore: unrelated_type_equality_checks
      if (namecontroller.text.length <= 3) {
        Apptools().shoesnackbar(
            'Must be at least 3 characters!', true, context, Colors.red);
      } else {
        deletespace();

        // Apptools().shoesnackbar('this username is not  alredy been use please!',
        //     true, context, Colors.green);
        setState(() {
          _isloding = true;
        });
        deletespace();
        String res = await Authmethods().signUser(
            userName: namecontroller.text,
            password: passcontroller.text,
            email: emailcontroller.text,
            context: context);

        setState(() {
          _isloding = false;
          namecontroller.text = '';
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
  }

  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<SignupValidation>(context);
    ToastContext().init(context);
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.blue, gradient: Gcontainer().lineargrant()),
          child: Stack(children: [
            Container(
              height: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 22, 0, 27),
                borderRadius: BorderRadius.circular(15),
              ),
              margin: const EdgeInsets.only(
                  left: 15, right: 15, top: 30, bottom: 10),
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
                                        color:
                                            Color.fromARGB(255, 26, 206, 32)),
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
                            TextFormField(
                              inputFormatters: [
                                if (namecontroller.text == '  ')
                                  FilteringTextInputFormatter.deny(
                                      RegExp(r'\s'))
                              ],
                              focusNode: node,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                  hintText: 'Enter Your UserName',
                                  hintStyle:
                                      const TextStyle(color: Colors.white30),
                                  helperStyle:
                                      const TextStyle(color: Colors.white),
                                  contentPadding: const EdgeInsets.all(8),
                                  errorText: validationService.firstName.error),
                              // hintText: 'Enter Your UserName',
                              // isobs: false,

                              controller: namecontroller,
                              onChanged: (value) {
                                validationService.changeFirstName(
                                    value, _isiconloding);
                              },
                            ),
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
                                keyboardType: TextInputType.emailAddress,
                                hintText: 'Enter Your Email',
                                isobs: false,
                                textEditingController: emailcontroller),
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
                                keyboardType: TextInputType.emailAddress,
                                hintText: 'Enter Your password',
                                isobs: true,
                                textEditingController: passcontroller),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap:
                              !(validationService.isValid) ? null : siginuser,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(15),
                                gradient: !(validationService.isValid)
                                    ? Gcontainer().errorcontainer()
                                    : Gcontainer().buttonLinear()),
                            child: _isloding
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
                        ),
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Loggin()));
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
            playContainer()
          ]),
        ),
      ],
    )));
  }
}
