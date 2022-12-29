// ignore_for_file: invalid_use_of_protected_member

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_content_share/flutter_social_content_share.dart';

import '../../firebase_method/message_method/Db_helper/DatabaseHelper.dart';

class ShearData {
  String username = 'unkhow';
  shareOnFacebook() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    username = (snapshot.data() as Map<String, dynamic>)['userName'];
    try {
      String? result = await FlutterSocialContentShare.share(
        type: ShareType.facebookWithoutImage,
        url: dynamicLink,
        imageUrl:
            'https://www.insperity.com/wp-content/uploads/Referral-_Program1200x600.png',
        quote: "write a secret anonymous message for me",
      );
    } catch (e) {
      log("$e");
    }
  }

  /// SHARE ON INSTAGRAM CALL
  shareOnInstagram() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    username = (snapshot.data() as Map<String, dynamic>)['userName'];
    String? result = await FlutterSocialContentShare.share(
        type: ShareType.instagramWithImageUrl,
        imageName: "i won't know who wrot it..",
        url: dynamicLink,
        quote: "write a secret anonymous message to  me I Won' "
            "t know who wrote it.."
            "  Add this UserName Befor sending message to me 👉👉$username👈👈",
        imageUrl:
            "https://www.insperity.com/wp-content/uploads/Referral-_Program1200x600.png");

    return result;
  }

  /// SHARE ON WHATSAPP CALL
  shareWatsapp() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    username = (snapshot.data() as Map<String, dynamic>)['userName'];
    String? result = await FlutterSocialContentShare.shareOnWhatsapp(
      dynamicLink,
      "write a secret anonymous message to  me I Won't know who wrote it.. "
      "  Add this UserName Befor sending message to me 👉👉$username👈👈",

      // ignore: avoid_print)
    );
  }

  /// SHARE ON EMAIL CALL
  share(BuildContext context) async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    username = (snapshot.data() as Map<String, dynamic>)['userName'];
    final RenderObject? box = context.findRenderObject();

    // Share.share(
    //     "   $dynamicLink"
    //     " write a secret anonymous message💝💌💌 to  me I Won't know who wrote it.."
    //     "  Add this UserName Befor sending message to me 👉👉$username👈👈",
    //     subject:
    //         "write a secret anonymous message to  me I Won't know who wrote it.. ");
  }

  /// SHARE ON SMS CALL
  shareSMS() async {
    String? result = await FlutterSocialContentShare.shareOnSMS(
        recipients: ["xxxxxx"], text: "Text appears here");
    print(result);
  }
}
