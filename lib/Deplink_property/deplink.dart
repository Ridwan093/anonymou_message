

// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
// import 'package:flutter/material.dart';

// import '../UI_screen/message_layout/sendMessage_screen/writing_post.dart';
// import '../UI_screen/userInfo/userprofile.dart';
// import '../common/simple_dialog/alertDialoge.dart';
// import '../common/simple_dialog/scalffodsnackbar.dart';

// class Deplink{

//    initDynamicLinks() async {
//     // this is called when app comes from background
//     FirebaseDynamicLinks.instance.onLink;

//     // this is called when app is not open in background

//     final PendingDynamicLinkData? data =
//         await FirebaseDynamicLinks.instance.getInitialLink();
//     final Uri? deepLink = data?.link;

//     if (deepLink != null) {
//       AlaertDb().dialog(
//           context: context,
//           controller: namecontroler,
//           ontap: () {
//             if (namecontroler.text.isEmpty) {
//               Apptools().shoesnackbar(
//                   'insert Your Friend Name', true, context, Colors.red);
//             } else {
//               Navigator.pushReplacement(context,
//                   MaterialPageRoute(builder: (context) => const Writingpost()));
//             }
//           });
//     }
//     setState(() {
//       islodinOTP = true;
//     });
//   }
// }