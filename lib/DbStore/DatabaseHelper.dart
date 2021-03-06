import 'package:anonymouse_messages/DbStore/poste.dart';
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

// ๐๐๐๐๐๐ญ๐ญ๐ข๐ขโ๏ธโ๏ธโ๏ธ๐๐๐๐๐๐โค๏ธโค๏ธโค๏ธโค๏ธ๐
// โค๏ธโค๏ธ๐โค๏ธ๐โค๏ธ๐โค๏ธ๐โค๏ธ๐๐งก๐งก๐โค๏ธ๐๐งก๐๐งก๐๐งก๐
// โค๏ธ๐โค๏ธ๐โค๏ธ๐โค๏ธ๐โค๏ธ๐โค๏ธโค๏ธ๐โค๏ธ๐โค๏ธ๐โค๏ธ๐โค๏ธ๐โค๏ธ๐
// โค๏ธโค๏ธโค๏ธโค๏ธ๐โค๏ธโค๏ธโค๏ธโค๏ธ๐โค๏ธโค๏ธโค๏ธ๐ค๐๐ค๐ค๐โค๏ธ๐โค๏ธ๐๐๐
// ๐๐๐ญ๐ญ๐ข๐ขโ๏ธโ๏ธโ๏ธ๐๐๐๐๐๐โค๏ธโค๏ธโค๏ธโค๏ธ๐โค๏ธโค๏ธ๐โค๏ธ๐โค๏ธ๐โค๏ธ
// ๐โค๏ธ๐๐งก๐งก๐โค๏ธ๐๐งก๐๐งก๐๐งก๐โค๏ธ๐โค๏ธ๐โค๏ธ๐โค๏ธ๐โค๏ธ๐โค๏ธโค๏ธ
// ๐โค๏ธ๐โค๏ธ๐โค๏ธ๐โค๏ธ๐โค๏ธ๐โค๏ธโค๏ธโค๏ธโค๏ธ๐โค๏ธโค๏ธโค๏ธโค๏ธ๐โค๏ธโค๏ธโค๏ธ๐ค๐๐ค
// ๐ค๐โค๏ธ๐โค๏ธ
//Joygiver ๐ My ๐๐๐๐๐๐๐๐๐๐๐๐๐๐๐๐๐๐๐๐
}
