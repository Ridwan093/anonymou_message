import 'dart:developer';

import 'package:anonymouse_messages/loggin_service/logging.dart';
import 'package:anonymouse_messages/loggin_service/resurcese/scalffodsnackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import '../linergrant.dart';

class Authmethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _database = FirebaseFirestore.instance;

  signUser(
      {required String userName,
      required String password,
      required String email,
      required BuildContext context}) async {
    String res = 'somthing went wrong';
    try {
      if (password.isNotEmpty || email.isNotEmpty || userName.isNotEmpty) {
        UserCredential cre = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        await _database.collection("user").doc(cre.user!.uid).set({
          "userName": userName,
          "uid": cre.user!.uid,
          "email": email,
          "password": password,
        });
        return res = 'success';
      } else if (password.isEmpty || email.isEmpty || userName.isEmpty) {
        Apptools()
            .shoesnackbar('fill all the feilds!', true, context, Colors.red);
      } else if (userName.length >= 3) {
        Apptools().shoesnackbar(
            'Must be at least 3 characters !', true, context, Colors.red);
      }
    } on FirebaseAuthException catch (erro) {
      if (erro.code == 'invalid-email') {
        res = 'The email is badly formatted';
      } else if (erro.code == 'weak-password') {
        res = 'passworld should be at least 6 character';
      } else if (erro.code == 'email-already-in-use') {
        res = 'the email is already in use by other user';
      } else if (erro.code == 'operation-not-allowed') {
        res = ' App Error';
      }

      log(erro.toString());
      Apptools().shoesnackbar(res, true, context, Colors.red);
    }
    return res;
  }

  login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    String res = "somthing went Wrong";
    try {
      if (password.isNotEmpty || email.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else if (password.isEmpty || email.isEmpty) {
        Apptools()
            .shoesnackbar('fill all the feilds!', true, context, Colors.red);
      }
      res = 'success';
    } on FirebaseAuthException catch (erro) {
      if (erro.code == 'invalid-email') {
        res = 'The email is badly formatted';
      } else if (erro.code == 'wrong-pssword') {
        res = 'wrong passworld';
      } else if (erro.code == 'user-not-found') {
        res = 'user  Not found';
      } else if (erro.code == 'user-disabled') {
        res = ' sim like Admin as Deleted or Disable this account';
      } else if (erro.code == 'network-request-failed') {
        res = 'Network error!';
      } else if (erro.code == 'network-request-failed') {
        res = 'Network error!';
      }

      Apptools().shoesnackbar(res, true, context, Colors.red);
    }
    return res;
  }

  weblogin(
      {required String email,
      required String password,
      required BuildContext context}) async {
    String res = "somthing went Wrong";
    try {
      if (password.isNotEmpty || email.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else if (password.isEmpty || email.isEmpty) {
        Apptools()
            .shoesnackbar('fill all the feilds!', true, context, Colors.red);
      }
      res = 'success';
    } on FirebaseAuthException catch (erro) {
      if (erro.code == 'invalid-email') {
        res = 'The email is badly formatted';
      } else if (erro.code == 'wrong-pssword') {
        res = 'wrong passworld';
      } else if (erro.code == 'user-not-found') {
        res = 'user  Not found';
      } else if (erro.code == 'user-disabled') {
        res = ' sim like Admin as Deleted or Disable this account';
      } else if (erro.code == 'network-request-failed') {
        res = 'Network error!';
      } else if (erro.code == 'network-request-failed') {
        res = 'Network error!';
      }

      Apptools().toast(res, context, Colors.red);
    }
    return res;
  }

  Future siginout(BuildContext context) async {
    await _auth.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: ((context) => const Loggin())));
  }

  Future resetpassworld(
      {required String email, required BuildContext context}) async {
    String res = "somthing went Wrong";
    try {
      await _auth.sendPasswordResetEmail(email: email).whenComplete(() =>
          Apptools().dialog(
              context: context,
              title:
                  'the reseting Link was send to your Email please visite your email and reset your passworld!',
              imageUrl: Gcontainer().networkimage()));
      res = 'success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        res = 'User Not found!';
      } else if (e.code == 'invalid-email') {
        res = 'The email is badly formatted';
      } else if (e.code == 'too-many-requests') {
        res = 'your are rich your limite try again later';
      } else if (e.code == 'network-request-failed') {
        res = 'Network error!';
      }

      Apptools().shoesnackbar(res, true, context, Colors.red);
    }
  }

  Future webresetpassworld(
      {required String email, required BuildContext context}) async {
    String res = "somthing went Wrong";
    try {
      await _auth.sendPasswordResetEmail(email: email).whenComplete(() =>
          Apptools().dialog(
              context: context,
              title:
                  'the reseting Link was send to your Email please visite your email and reset your passworld!',
              imageUrl: Gcontainer().networkimage()));
      res = 'success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        res = 'User Not found!';
      } else if (e.code == 'invalid-email') {
        res = 'The email is badly formatted';
      } else if (e.code == 'too-many-requests') {
        res = 'your are rich your limite try again later';
      } else if (e.code == 'network-request-failed') {
        res = 'Network error!';
      }

      Apptools().toast(res, context, Colors.red);
    }
  }
}
