import 'package:anonymouse_messages/UI_screen/auth_layout/sign_up.dart';
import 'package:anonymouse_messages/backEnd_connection/message_buttons/post_message_button.dart';
import 'package:anonymouse_messages/common/custormise_filed/message_filed.dart';
import 'package:anonymouse_messages/firebase_method/message_method/Db_helper/DatabaseHelper.dart';
import 'package:anonymouse_messages/common/simple_dialog/scalffodsnackbar.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../common/liner_forder/linergrant.dart';
import '../../userInfo/userprofile.dart';

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

class _WritingpostState extends State<Writingpost> {
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
                                  CustomiseField(
                                    keyboardType: TextInputType.name,
                                    hintText: '254 characters remaining',
                                    maxLength: 252,
                                    maxLines: 7,
                                    controller: messagecontroller,
                                    iscont: true,
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
                              PostMessageButton(
                                  messagecontroller: messagecontroller,
                                  isloding: isloding),
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
