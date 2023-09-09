// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:anonymouse_messages/common/liner_forder/linergrant.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final Widget page;
  const SplashScreen({Key? key, required this.page}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      setState(() {
        opacity = 1.0;
      });
    });
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => widget.page),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Change the background color as needed
      body: Container(
        decoration: BoxDecoration(
            color: Colors.blue, gradient: Gcontainer().lineargrant()),
        child: Center(
          child: AnimatedOpacity(
            opacity: opacity,
            duration: const Duration(seconds: 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Add your splash screen image here
                CircleAvatar(
                  backgroundImage: NetworkImage(Gcontainer().networkimage()),
                  radius: 50,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Anonymous Message',
                  style: TextStyle(
                    color: Colors.white, // Change the text color
                    fontSize: 24, // Adjust the font size
                    fontWeight: FontWeight.bold, // Add font weight if needed
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
