// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:anonymouse_messages/common/homepage_widget/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:anonymouse_messages/common/simple_dialog/scalffodsnackbar.dart';
import 'package:anonymouse_messages/UI_screen/userInfo/shearfile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_social_content_share/flutter_social_content_share.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

import '../../common/liner_forder/linergrant.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();

    initDynamicLinks();

    getusername();
  }
//muste be initalize some how so i can not customise it////
//muste be initalize some how so i can not customise it////
//muste be initalize some how so i can not customise it////

  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = (await FlutterSocialContentShare.platformVersion)!;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      platformVersion = platformVersion;
    });
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

  ///all this fuction was require build///

  initDynamicLinks() async {
    // this is called when app comes from background
    FirebaseDynamicLinks.instance.onLink;

    // this is called when app is not open in background

    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;

    if (deepLink != null) {
      
      Navigator.pushNamed(context, '/post',
          arguments: deepLink.queryParameters['title']);
    } else if (deepLink == null) {
      return Apptools()
          .shoesnackbar('somthing wrong', true, context, Colors.red);
    }
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
                            Text('Running on: $username\n'),
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
                              "Users's Profile",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              " Shear your profile link to ge Responses from your friend. Go to \"view Messages"
                              " to Check out the Responses",
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
                                GestureDetector(
                                  onTap: () {
                                    ShearData().shareWatsapp();
                                    // setState(() {
                                    //   shareWatsapp();
                                    // });
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(15),
                                        gradient: Gcontainer().buttonLinear()),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    child: const Center(
                                        child: Text(' View Messages ->')),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Hwidget(
                                    title: 'Shear My profile',
                                    color: Colors.red,
                                    icon: Icons.share,
                                    ontap: () {}),
                                const SizedBox(
                                  height: 20,
                                ),
                                Hwidget(
                                    title: ' Shear To facebook',
                                    color: Colors.blue,
                                    icon: (FontAwesomeIcons.facebookSquare),
                                    ontap: () {
                                      ShearData().shareWatsapp();
                                    }),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                            Hwidget(
                                title: 'Shear To Whatsapp',
                                color: const Color.fromARGB(255, 61, 212, 66),
                                icon: (FontAwesomeIcons.whatsapp),
                                ontap: () {
                                  ShearData().shareWatsapp();
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            Hwidget(
                                title: 'Shear To Instagram',
                                color: Colors.red,
                                icon: (FontAwesomeIcons.instagram),
                                ontap: () {
                                  ShearData().shareOnInstagram();
                                }),
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
                                child: Center(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text('Setting'),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    FaIcon(Icons.settings),
                                  ],
                                )),
                              ),
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
