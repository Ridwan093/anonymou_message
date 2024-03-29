import 'package:anonymouse_messages/firebase_method/loggin_service/resurcese/auth_method.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_social_content_share/flutter_social_content_share.dart';

import '../liner_forder/linergrant.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

// ignore: prefer_typing_uninitialized_variables

class _SettingState extends State<Setting> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();

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

  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = (await FlutterSocialContentShare.platformVersion)!;
      // ignore: nullable_type_in_catch_clause
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                          height: 30,
                        ),
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              height: 40,
                              color: Colors.grey,
                              child: Row(
                                children: [
                                  const Text(
                                    'UserName:',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    username,
                                    style: const TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              height: 40,
                              color: Colors.grey,
                              child: Row(
                                children: [
                                  const Text(
                                    'Version:',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    _platformVersion,
                                    style: const TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              height: 40,
                              color: Colors.grey,
                              child: Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: const [
                                  Text(
                                    'App Version',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    " 0.0.1",
                                    style: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        InkWell(
                          onTap: () {
                            Authmethods().siginout(context, setState);
                            setState(() {});
                          },
                          child: Material(
                            elevation: 3.0,
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height: 50,
                              width: 105,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Sign Out',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.logout,
                                      size: 19,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 100, left: 10, right: 10),
                          child: Gcontainer().terms(),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
