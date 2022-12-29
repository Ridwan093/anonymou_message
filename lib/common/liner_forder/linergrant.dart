import 'package:flutter/material.dart';

class Gcontainer {
  lineargrant() {
    return const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomRight,
        colors: [
          Color.fromARGB(255, 211, 6, 247),
          Color.fromARGB(255, 166, 76, 182),
          Color.fromARGB(255, 166, 76, 182),
          Colors.teal,
          Colors.teal
        ]);
  }

  buttonLinear() {
    return const LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.fromARGB(255, 166, 76, 182),
          Color.fromARGB(255, 166, 76, 182),
          Color.fromARGB(255, 166, 76, 182),
          Colors.teal,
          Colors.teal
        ]);
  }

  errorcontainer() {
    return const LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.fromARGB(255, 142, 113, 145),
          Color.fromARGB(255, 162, 116, 170),
          Color.fromARGB(255, 153, 105, 160),
          Color.fromARGB(255, 114, 121, 120),
          Color.fromARGB(255, 122, 133, 132)
        ]);
  }

  Widget terms() {
    return const Text(
      'By using this service. you are agree to our privacy policy. Terms of service and any related policies ',
      style: TextStyle(color: Colors.white30, fontWeight: FontWeight.bold),
    );
  }

  static String readTimestamp(int timestamp) {
    var now = DateTime.now();
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    var diff = now.difference(date);
    var time = '';

    if (diff.inSeconds <= 0 ||
        diff.inSeconds > 0 && diff.inMinutes == 0 ||
        diff.inMinutes > 0 && diff.inHours == 0 ||
        diff.inHours > 0 && diff.inDays == 0) {
      if (diff.inHours > 0) {
        time = diff.inHours.toString() + 'h ago';
      } else if (diff.inMinutes > 0) {
        time = diff.inMinutes.toString() + 'm ago';
      } else if (diff.inSeconds > 0) {
        time = 'now';
      } else if (diff.inMilliseconds > 0) {
        time = 'now';
      } else if (diff.inMicroseconds > 0) {
        time = 'now';
      } else {
        time = 'now';
      }
    } else if (diff.inDays > 0 && diff.inDays < 7) {
      time = diff.inDays.toString() + 'd ago';
    } else if (diff.inDays > 6) {
      time = (diff.inDays / 7).floor().toString() + 'w ago';
    } else if (diff.inDays > 29) {
      time = (diff.inDays / 30).floor().toString() + 'm ago';
    } else if (diff.inDays > 365) {
      time = '${date.month} ${date.day}, ${date.year}';
    }
    return time;
  }

  networkimage() {
    return 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStdjbrfHURVlHayPXKBxE5wGmPecaYW74WKDvtYpgMGo4Ijl1_fugDMn-0CoqiuiFMKmc&usqp=CAU';
  }
}
