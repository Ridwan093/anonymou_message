// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:anonymouse_messages/UI_screen/message_layout/sendMessage_screen/message_body.dart';
import 'package:anonymouse_messages/common/liner_forder/linergrant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WebViews extends StatefulWidget {
  const WebViews({Key? key}) : super(key: key);

  @override
  State<WebViews> createState() => _WebViewsState();
}

class _WebViewsState extends State<WebViews> {
  @override
  void initState() {
    super.initState();
    getusername();
  }

  String username = '';

  void getusername() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
      username = (snapshot.data() as Map<String, dynamic>)['userName'];
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    height: 700,
                    width: 600,
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
                                'My Answers..',
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
                                children: const [
                                  Text(
                                    '👇Scroll👇 down to check out the messages that you have receive',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white30,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 350, child: MessageBody()),
                              const SizedBox(
                                height: 25,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(15),
                                        gradient: Gcontainer().buttonLinear()),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    child: Center(
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text('Go Back  <-'),
                                      ],
                                    ))),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
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
