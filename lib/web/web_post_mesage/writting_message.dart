import 'package:anonymouse_messages/userInfo/userprofile.dart';
import 'package:anonymouse_messages/web/web_auth_methode/web_regester.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../DbStore/DatabaseHelper.dart';
import '../../loggin_service/linergrant.dart';
import '../../loggin_service/resurcese/scalffodsnackbar.dart';
import '../../message_properties/writing_post.dart';

// ignore: camel_case_types
class Web_post_message extends StatefulWidget {
  const Web_post_message({Key? key}) : super(key: key);

  @override
  State<Web_post_message> createState() => _Web_post_messageState();
}

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

// ignore: camel_case_types
DbHelper db = DbHelper().res as DbHelper;
bool isloding = false;
final webmessagecontroller = TextEditingController();

class _Web_post_messageState extends State<Web_post_message> {
  _uploadTask(BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (messagecontroller.text.isEmpty) {
      Apptools().toast('please insert some text!', context, Colors.red);
    } else {
      setState(() {
        isloding = true;
      });

      String res = await DbHelper().postmessageToDatabase(
          message: webmessagecontroller.text, username: namecontroler.text);

      print(messagecontroller.text.toString());
      setState(() {
        isloding = false;
        islodincontainer = false;
      });
      if (res == 'success') {
        Apptools().toast('success 😜😜😜😜', context, Colors.green);
      } else {
        Apptools().toast(res.toString(), context, Colors.red);
      }

      webmessagecontroller.text = '';

      if (auth.currentUser?.uid == null) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const WebSignin()));
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
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return systemnavigato();
      },
      child: Scaffold(
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
                  )),
                  Positioned(
                      top: 100,
                      child: !islodinOTP
                          ? Container(
                              height: 200,
                              width: 300,
                              color: Colors.cyanAccent,
                              child: Center(
                                child: RaisedButton(
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
