// ignore_for_file: file_names

import 'package:anonymouse_messages/firebase_method/message_method/firebaseStorage_property/poste.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:uuid/uuid.dart';

import 'package:flutter/material.dart';

const String dynamicLink = "https://anounymous.page.link/muUh";

class DbHelper {
  String res = 'somrthing went wrong';

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  late BuildContext context;
  Future<void> delete(String postid) async {
    await firestore.collection('post').doc(postid).delete();
  }

  postmessageToDatabase(
      {required String message, required String username}) async {
    //get user uniq  Names
    // DocumentSnapshot snapshot = await FirebaseFirestore.instance
    //     .collection('user')
    //     .doc(FirebaseAuth.instance.currentUser!.uid)
    //     .get();
    // username = (snapshot.data() as Map<String, dynamic>)['userName'];

    String postId = const Uuid().v1();

    // ignore: unused_local_variable
    Post post = Post(
      message: message,
      postId: postId,
      username: username,
      timepublise: DateTime.now().microsecondsSinceEpoch,
    );

    try {
      firestore.collection('post').doc(postId).set({
        'Message': message,
        'Timepublise': DateTime.now().millisecondsSinceEpoch,
        'postId': postId,
        'username': username,
      });

      res = 'success';
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

// 😜😜😜😝😝😭😭😢😢☝️☝️☝️👇👇👇👇👇👇❤️❤️❤️❤️💕
// ❤️❤️💕❤️💕❤️💕❤️💕❤️💕🧡🧡💕❤️💕🧡💕🧡💕🧡💕
// ❤️💕❤️💕❤️💕❤️💕❤️💕❤️❤️💕❤️💕❤️💕❤️💕❤️💕❤️💕
// ❤️❤️❤️❤️💕❤️❤️❤️❤️💌❤️❤️❤️💤💌💤💤💌❤️👄❤️😜😜😜
// 😝😝😭😭😢😢☝️☝️☝️👇👇👇👇👇👇❤️❤️❤️❤️💕❤️❤️💕❤️💕❤️💕❤️
// 💕❤️💕🧡🧡💕❤️💕🧡💕🧡💕🧡💕❤️💕❤️💕❤️💕❤️💕❤️💕❤️❤️
// 💕❤️💕❤️💕❤️💕❤️💕❤️💕❤️❤️❤️❤️💕❤️❤️❤️❤️💌❤️❤️❤️💤💌💤
// 💤💌❤️👄❤️
//Joygiver 💞 My 👉👉👉👉👉👉👈👈👈👈👈👈💝💝💝💌💌💌💌💌
}
