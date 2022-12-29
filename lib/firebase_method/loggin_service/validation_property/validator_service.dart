import 'package:anonymouse_messages/UI_screen/auth_layout/sign_up.dart';
import 'package:anonymouse_messages/firebase_method/loggin_service/validation_property/validation_items.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../common/simple_dialog/scalffodsnackbar.dart';

class SignupValidation with ChangeNotifier {
  ValidationItem _firstName = ValidationItem(null, null);
  ValidationItem _lastName = ValidationItem(null, null);
  ValidationItem _dob = ValidationItem(null, null);

  //Getters
  ValidationItem get firstName => _firstName;
  ValidationItem get lastName => _lastName;
  ValidationItem get dob => _dob;
  bool get isValid {
    if (_firstName.value != null) {
      return true;
    } else {
      return false;
    }
  }

  //Setters
  void changeFirstName(String value, bool isloding, context) async {
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('user')
        .where('userName', isEqualTo: namecontroller.text)
        .get();
    final List<QueryDocumentSnapshot> doc = result.docs;
    if (doc.isNotEmpty) {
      _firstName = ValidationItem(null, "This user Name Alredy Exist");
      Apptools().toast(
          'this username alredy been use please choose another one!',
          context,
          Colors.red);
      isloding = true;
      // _firstName = ValidationItem(null, "This user Name Alredy Exist");
    } else {
      _firstName = ValidationItem(value, null);
      isloding = false;
    }

    // if (value.length >= 3) {
    //   _firstName = ValidationItem(value, null);
    // } else {
    //   _firstName = ValidationItem(null, "Must be at least 3 characters");
    // }
    notifyListeners();
  }

  void changeLastName(String value) {
    if (value.length >= 3) {
      _lastName = ValidationItem(value, null);
    } else {
      _lastName = ValidationItem(null, "Must be at least 3 characters");
    }
    notifyListeners();
  }

  void changeDOB(String value) {
    try {
      DateTime.parse(value);
      _dob = ValidationItem(value, null);
    } catch (error) {
      _dob = ValidationItem(null, "Invalid Format");
    }
    notifyListeners();
  }

  void submitData() {
    print(
        "FirstName: ${firstName.value}, LastName: ${lastName.value}, ${DateTime.parse(dob.value.toString())}");
  }
}
