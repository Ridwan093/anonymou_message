import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class Apptools {
  shoesnackbar(String content, bool isicon, BuildContext context, Color color) {
    // Toast.show(content,
    //     webShowClose: true,
    //     backgroundColor: color,
    //     webTexColor: Colors.red,
    //     rootNavigator: true,
    //     duration: 2,
    //     gravity: Toast.lengthLong);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            content,
            style: const TextStyle(color: Colors.white),
          ),
          isicon
              ? const Icon(
                  Icons.error,
                  color: Colors.white,
                )
              : const SizedBox()
        ],
      ),
      backgroundColor: color,
    ));

    // ignore: unused_element
  }

  toast(
    String content,
    BuildContext context,
    Color color,
  ) {
    Toast.show(content,
        webShowClose: true,
        backgroundColor: color,
        webTexColor: Colors.red,
        rootNavigator: true,
        duration: 2,
        gravity: Toast.lengthLong);

    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //   content: Text(
    //     content,
    //     style: TextStyle(color: Colors.white),
    //   ),
    //   backgroundColor: color,
    // ));

    // ignore: unused_element
  }

  void dialog(
      {required context, required String title, required String imageUrl}) {
    final GlobalKey key = GlobalKey<FormState>();
    var db = AlertDialog(
        content: SizedBox(
      height: 150,
      width: 200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'success!',
                style: TextStyle(
                    fontSize: 17,
                    color: Color.fromARGB(255, 26, 197, 78),
                    fontStyle: FontStyle.normal),
              ),
              const Divider(
                color: Color.fromARGB(255, 166, 76, 182),
              ),
              Text(
                title,
                style: const TextStyle(
                    fontSize: 17,
                    color: Color.fromARGB(255, 221, 248, 245),
                    fontStyle: FontStyle.normal),
              )
            ],
          ),
        ),
      ),
    ));

    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: '',
        transitionDuration: const Duration(seconds: 1),
        transitionBuilder: (BuildContext context, Animation<double> a1,
                Animation<double> a2, Widget child) =>
            SlideTransition(
              position:
                  Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero)
                      .animate(a1),
              child: db,
            ),
        pageBuilder: (context, anim1, anim2) {
          return Transform.rotate(angle: anim1.value);
        });
  }
}
