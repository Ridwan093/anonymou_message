import 'package:anonymouse_messages/validation_property/validator_service.dart';
import 'package:anonymouse_messages/validation_property/validator_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Validationform extends StatelessWidget {
  final TextEditingController namecontroller;
  final bool islodin;

  const Validationform(
      {Key? key, required this.namecontroller, required this.islodin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<SignupValidation>(context);
    return TextFormField(
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          hintText: 'Enter Your UserName',
          hintStyle: const TextStyle(color: Colors.white30),
          helperStyle: const TextStyle(color: Colors.white),
          contentPadding: const EdgeInsets.all(8),
          suffixIcon: !(validationService.isValid)
              ? const IconButton(
                  onPressed: null, icon: CircularProgressIndicator())
              : Icon(
                  Icons.person,
                  color: !(validationService.isValid)
                      ? Colors.green
                      : Colors.white54,
                ),
          errorText: validationService.firstName.error),
      // hintText: 'Enter Your UserName',
      // isobs: false,

      controller: namecontroller,
      onChanged: (value) {
        validationService.changeFirstName(value, islodin);
      },
    );
  }
}
