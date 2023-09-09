// ignore_for_file: invalid_use_of_protected_member, deprecated_member_use

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_content_share/flutter_social_content_share.dart';
import 'package:social_share/social_share.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../firebase_method/message_method/Db_helper/DatabaseHelper.dart';

class ShearData {
  String username = 'unkhow';

  void shareOnFacebook() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    username = (snapshot.data() as Map<String, dynamic>)['userName'];
    String contentUrl = dynamicLink; // Replace with your content URL
    String description = ""
        " write a secret anonymous message💝💌💌 to  me I Won't know who wrote it.."
        "  Add this UserName Befor sending message to me 👉👉$username👈👈"
        "write a secret anonymous message to  me I Won't know who wrote it.. "; // Replace with your title
    const String title = dynamicLink; // Replace with your description
    const String imageUrl =
        ''; // Replace with your image URL

    String url = 'https://www.facebook.com/sharer/sharer.php?'
        'u=$contentUrl&title=$title&description=$description&picture=$imageUrl';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
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
            "https://thumbs.dreamstime.com/b/online-money-transfer-vector-illustration-cartoon-flat-tiny-man-character-using-app-smartphone-send-fast-transaction-coin-to-woman-178490393.jpg");

    return result;
  }

  void shareOnWhatsApp() async {
     DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    username = (snapshot.data() as Map<String, dynamic>)['userName'];
    
    final String text =
        " write a secret anonymous message💝💌💌 to  me I Won't know who wrote it.."
        "  Add this UserName Befor sending message to me 👉👉$username👈👈"
        "write a secret anonymous message to  me I Won't know who wrote it.. "; // Replace with your text
    const String imageUrl =
        ''; // Replace with your image URL
    const String linkUrl = dynamicLink; // Replace with your link URL

    final String encodedText = Uri.encodeComponent(text);
    final String encodedImageUrl = Uri.encodeComponent(imageUrl);
    final String encodedLinkUrl = Uri.encodeComponent(linkUrl);

    final String whatsappUrl =
        'https://wa.me/?text=$encodedText%0A$encodedImageUrl%0A$encodedLinkUrl';

    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }

  /// SHARE ON WHATSAPP CALL
  shareWatsapp() async {
    // DocumentSnapshot snapshot = await FirebaseFirestore.instance
    //     .collection('user')
    //     .doc(FirebaseAuth.instance.currentUser!.uid)
    //     .get();
    // username = (snapshot.data() as Map<String, dynamic>)['userName'];
    SocialShare.shareWhatsapp(
      "$dynamicLink"
      " write a secret anonymous message💝💌💌 to  me I Won't know who wrote it.."
      "  Add this UserName Befor sending message to me 👉👉$username👈👈"
      "write a secret anonymous message to  me I Won't know who wrote it.. ",
    ).then((data) {
      log(data!);
    });
    // String? result = await FlutterSocialContentShare.shareOnWhatsapp(
    //   dynamicLink,
    //   "write a secret anonymous message to  me I Won't know who wrote it.. "
    //   "  Add this UserName Befor sending message to me 👉👉$username👈👈",

    //   // ignore: avoid_print)
    // );
  }

  /// SHARE ON EMAIL CALL
  share(BuildContext context) async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    username = (snapshot.data() as Map<String, dynamic>)['userName'];
    SocialShare.shareOptions(
      "$dynamicLink"
      " write a secret anonymous message💝💌💌 to  me I Won't know who wrote it.."
      "  Add this UserName Befor sending message to me 👉👉$username👈👈"
      "write a secret anonymous message to  me I Won't know who wrote it.. ",
    ).then((data) {
    
    });

    // Share.share(
    //     "   $dynamicLink"
    //     " write a secret anonymous message💝💌💌 to  me I Won't know who wrote it.."
    //     "  Add this UserName Befor sending message to me 👉👉$username👈👈",
    //     subject:
    //         "write a secret anonymous message to  me I Won't know who wrote it.. ");
  }

  
}
