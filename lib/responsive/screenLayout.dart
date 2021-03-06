// ignore: file_names
import 'package:anonymouse_messages/responsive/dismisson.dart';
import 'package:flutter/material.dart';

class ScreenLayout extends StatelessWidget {
  final Widget websreen;
  final Widget mobilescreen;
  const ScreenLayout(
      {Key? key, required this.websreen, required this.mobilescreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        if (constraints.maxWidth > websize) {
          return websreen;
        } else {
          return mobilescreen;
        }
      }),
    );
  }
}
