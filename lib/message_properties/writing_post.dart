import 'package:anonymouse_messages/DbStore/DatabaseHelper.dart';
import 'package:anonymouse_messages/loggin_service/resurcese/scalffodsnackbar.dart';
import 'package:anonymouse_messages/loggin_service/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../loggin_service/linergrant.dart';
import '../userInfo/userprofile.dart';

bool islodincontainer = false;
bool islodinOTP = false;

class Writingpost extends StatefulWidget {
  static const String routeName = '/writinpost';

  const Writingpost({
    Key? key,
  }) : super(key: key);

  @override
  State<Writingpost> createState() => _WritingpostState();
}

final TextEditingController messagecontroller = TextEditingController();
// ignore: non_constant_identifier_names

bool isloding = false;

textfield(bool iscont,
    {required TextInputType keyboardType,
    required String hintText,
    required int maxLines,
    required maxLength,
    // ignore: non_constant_identifier_names
    required TextEditingController Controller}) {
  return TextField(
    strutStyle: StrutStyle.fromTextStyle(
        const TextStyle(fontSize: 20, color: Colors.white)),
    cursorColor: Colors.white,
    style: const TextStyle(color: Colors.white54),
    keyboardType: keyboardType,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(
        color: Colors.white30,
      ),
      helperStyle: const TextStyle(
        color: Colors.white,
      ),
      contentPadding: const EdgeInsets.all(8),
    ),
    maxLines: iscont ? maxLines : 0,
    maxLength: maxLength,
    controller: Controller,
  );
}

DbHelper db = DbHelper().res as DbHelper;

class _WritingpostState extends State<Writingpost> {
  _uploadTask(BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (messagecontroller.text.isEmpty) {
      Apptools()
          .shoesnackbar('please insert some text!', true, context, Colors.red);
    } else {
      setState(() {
        isloding = true;
      });

      String res = await DbHelper().postmessageToDatabase(
          message: messagecontroller.text, username: namecontroler.text);

      print(messagecontroller.text.toString());
      setState(() {
        isloding = false;
        islodincontainer = false;
      });
      if (res == 'success') {
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

  systemnavigato() {
    SystemNavigator.pop();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return systemnavigato();
      },
      child: Scaffold(
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
                                'Say Something..',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Say Somthing About Me',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white30,
                                    ),
                                  ),
                                  textfield(
                                    true,
                                    keyboardType: TextInputType.name,
                                    hintText: '254 characters remaining',
                                    maxLength: 252,
                                    maxLines: 7,
                                    Controller: messagecontroller,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'put Ur Friend Name Here!',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white30,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              InkWell(
                                onTap: () => _uploadTask(context),
                                child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(15),
                                        gradient: Gcontainer().buttonLinear()),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    child: Center(
                                        child: !isloding
                                            ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  Text('Send Message  '),
                                                  FaIcon(
                                                    Icons.send,
                                                    size: 10,
                                                  )
                                                ],
                                              )
                                            : const CircularProgressIndicator())),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Gcontainer().terms(),
                              const SizedBox(
                                height: 10,
                              ),
                            ]),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 100,
                      child: !islodinOTP
                          ? Container(
                              height: 200,
                              width: 300,
                              color: Colors.cyanAccent,
                              child: Center(
                                child: ElevatedButton(
                                    child: const Text('set Container to false'),
                                    onPressed: () {
                                      setState(() {
                                        islodinOTP = false;
                                      });
                                    }),
                              ),
                            )
                          : Container())
                ],
              )),
        ),
      ),
    );
  }
}
