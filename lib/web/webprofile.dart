import 'package:anonymouse_messages/web/message_property/viewe_message.dart';
import 'package:anonymouse_messages/web/web_post_mesage/writting_message.dart';
import 'package:anonymouse_messages/web/web_settings/web_setting.dart';
import 'package:flutter/material.dart';

import 'package:anonymouse_messages/DbStore/DatabaseHelper.dart';

import 'package:anonymouse_messages/loggin_service/resurcese/scalffodsnackbar.dart';
import 'package:anonymouse_messages/simple_dialog/alertDialoge.dart';

import 'package:anonymouse_messages/userInfo/shearfile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toast/toast.dart';

import '../loggin_service/linergrant.dart';

import '../message_properties/writing_post.dart';
import '../setting/setting.dart';

TextEditingController namecontroler = TextEditingController();

class Webprofile extends StatefulWidget {
  const Webprofile({Key? key}) : super(key: key);

  @override
  State<Webprofile> createState() => _WebprofileState();
}

final TextEditingController emailcontroller = TextEditingController();

class _WebprofileState extends State<Webprofile> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initDynamicLinks();

    getusername();
  }

  String username = '';
// ignore: prefer_typing_uninitialized_variables

  void getusername() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
      username = (snapshot.data() as Map<String, dynamic>)['userName'];
    });
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

  Widget buttonContainer(
      {required String title,
      required Color color,
      required IconData icon,
      required VoidCallback ontap}) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(
              width: 10,
            ),
            Text(title)
          ],
        )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
            width: double.infinity,
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
                              Text(
                                " $username's Profile",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "$dynamicLink/$username",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white30,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                " Shear your profile link to ge Responses from your friend. Go to \"view Messages"
                                ""
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
                                      // ShearData().shareWatsapp( );
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (contex) =>
                                                  const WebViews()));
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          gradient:
                                              Gcontainer().buttonLinear()),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12),
                                      child: const Center(
                                          child: Text(' View Messages ->')),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  buttonContainer(
                                      title: 'Shear My profile',
                                      color: Colors.red,
                                      icon: Icons.share,
                                      ontap: () {
                                        ShearData().share(context);
                                      }),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  buttonContainer(
                                      title: ' Shear To facebook',
                                      color: Colors.blue,
                                      icon: (FontAwesomeIcons.facebookSquare),
                                      ontap: () {
                                        ShearData().shareOnFacebook();
                                        // Authmethods().siginout(context);
                                      }),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                              buttonContainer(
                                  title: 'Shear To Whatsapp',
                                  color: const Color.fromARGB(255, 61, 212, 66),
                                  icon: (FontAwesomeIcons.whatsapp),
                                  ontap: () {
                                    ShearData().shareWatsapp();
                                  }),
                              const SizedBox(
                                height: 10,
                              ),
                              buttonContainer(
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
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              const Web_setting())));
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
                  ),
                )
              ],
            )),
      ),
    );
  }
}
