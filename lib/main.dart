// Copyright 2021 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: unrelated_type_equality_checks, avoid_web_libraries_in_flutter

import 'dart:async';

import 'package:anonymouse_messages/UI_screen/auth_layout/logging.dart';
import 'package:anonymouse_messages/common/liner_forder/linergrant.dart';

import 'package:anonymouse_messages/responsive/screenLayout.dart';
import 'package:anonymouse_messages/UI_screen/userInfo/userprofile.dart';
import 'package:anonymouse_messages/responsive/splasscreen.dart';

import 'package:anonymouse_messages/web/Ul_screen/web_auth_screen/web_login.dart';

import 'package:anonymouse_messages/web/Ul_screen/webprofile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'firebase_method/loggin_service/validation_property/validator_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAb7iiISpjPDt3uilFZo03cnpM4cRw9rdE",
            appId: "1:989294827955:web:6d971f6fca74ffe588d3c6",
            messagingSenderId: "989294827955",
            projectId: "anonymouse-messanger-3edbc",
            storageBucket: "anonymouse-messanger-3edbc.appspot.com"));
  } else {
    await Firebase.initializeApp();
  }

  // iOS requires you run in release mode to test dynamic links ("flutter run --release").

  runApp(const AppRout());
}

class AppRout extends StatefulWidget {
  const AppRout({Key? key}) : super(key: key);

  @override
  State<AppRout> createState() => _AppRoutState();
}

class _AppRoutState extends State<AppRout> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignupValidation(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          home: StreamBuilder(
              stream: FirebaseAuth.instance.userChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    height: double.infinity,
                    decoration:
                        BoxDecoration(gradient: Gcontainer().lineargrant()),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircularProgressIndicator(),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Loding....",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  );
                }
                if (snapshot.hasData) {
                  return const ScreenLayout(
                      websreen: Webprofile(),
                      mobilescreen: SplashScreen(page: Userprofile()));
                }
                // ignore: unnecessary_null_comparison

                if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      children: const [Text('Somthing went Wrong')],
                    ),
                  );
                }

                return const ScreenLayout(
                    websreen: WebLoggin(),
                    mobilescreen: SplashScreen(page: Loggin()));
              })),
    );
  }
}
