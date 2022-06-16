import 'package:anonymouse_messages/loggin_service/linergrant.dart';
import 'package:flutter/material.dart';

class AlaertDb {
  void dialog({
    required context,
    required TextEditingController controller,
    required VoidCallback ontap,
  }) {
    var db = AlertDialog(
        // elevation: 100.0,
        content: Container(
      height: 200,
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.black, blurRadius: 130.0, spreadRadius: 250.0)
      ]),
      child: Container(
        color: Colors.grey.shade800,
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Provied your Friend name ❤️💕!',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  strutStyle: StrutStyle.fromTextStyle(
                      const TextStyle(color: Colors.white)),
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white54),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              style: BorderStyle.solid, color: Colors.white),
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'insert your friend Name',
                      hintStyle: const TextStyle(color: Colors.white30),
                      helperStyle: const TextStyle(color: Colors.white),
                      contentPadding: const EdgeInsets.all(8)),
                  controller: controller,
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: ontap,
                  child: Container(
                    height: 50,
                    width: 100,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        gradient: Gcontainer().buttonLinear()),
                    child: const Center(
                      child: Text(
                        'Submit',
                        style: TextStyle(),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));

    showGeneralDialog(
        context: context,
        barrierDismissible: false,
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
