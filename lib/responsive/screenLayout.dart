

// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ScreenLayout extends StatelessWidget {
  final Widget websreen;
  final Widget mobilescreen;
  const ScreenLayout(
      {Key? key, required this.websreen, required this.mobilescreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return kIsWeb ? websreen : mobilescreen;
  }
}
