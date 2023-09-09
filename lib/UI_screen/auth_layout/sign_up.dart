import 'package:anonymouse_messages/UI_screen/auth_layout/logging.dart';
import 'package:anonymouse_messages/backEnd_connection/sign_connet_button.dart';


import 'package:anonymouse_messages/firebase_method/loggin_service/textfild.dart';
import 'package:anonymouse_messages/UI_screen/message_layout/sendMessage_screen/writing_post.dart';
import 'package:anonymouse_messages/suggession_card/suggession_card.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';
import 'package:provider/provider.dart';


import '../../common/liner_forder/linergrant.dart';
import '../../firebase_method/loggin_service/validation_property/validator_service.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

final TextEditingController emailcontroller = TextEditingController();
final TextEditingController passcontroller = TextEditingController();
final TextEditingController namecontroller = TextEditingController();
bool _isloding = false;
FocusNode node = FocusNode();

class _SignupState extends State<Signup> {
  final bool _isiconloding = false;

  String username = '';
  // @override
  // void dispose() {
  //   super.dispose();
  //   emailcontroller.dispose();
  //   namecontroller.dispose();
  //   passcontroller.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<SignupValidation>(context);
    ToastContext().init(context);
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.blue, gradient: Gcontainer().lineargrant()),
          child: Stack(children: [
            Container(
              height: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 22, 0, 27),
                borderRadius: BorderRadius.circular(15),
              ),
              margin: const EdgeInsets.only(
                  left: 15, right: 15, top: 30, bottom: 10),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        CircleAvatar(
                          backgroundImage:
                              NetworkImage(Gcontainer().networkimage()),
                          radius: 50,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Regester!',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Recieve anonymous compliments from your friend and send anonymous messages to your friend for free.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white30,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            islodincontainer
                                ? const Text(
                                    "now it's your turn to creste an account and dare"
                                    " your friends to tell you what they think about you",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color:
                                            Color.fromARGB(255, 26, 206, 32)),
                                  )
                                : Container(),
                            const SizedBox(),
                            const Padding(
                              padding: EdgeInsets.only(
                                top: 10,
                              ),
                              child: Text(
                                'Your UserName',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white30,
                                ),
                              ),
                            ),
                            TextFormField(
                              inputFormatters: [
                                if (namecontroller.text == '  ')
                                  FilteringTextInputFormatter.deny(
                                      RegExp(r'\s'))
                              ],
                              focusNode: node,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                  hintText: 'Enter Your UserName',
                                  hintStyle:
                                      const TextStyle(color: Colors.white30),
                                  helperStyle:
                                      const TextStyle(color: Colors.white),
                                  contentPadding: const EdgeInsets.all(8),
                                  errorText: validationService.firstName.error),
                              // hintText: 'Enter Your UserName',
                              // isobs: false,

                              controller: namecontroller,
                              onChanged: (value) {
                                validationService.changeFirstName(
                                    value, _isiconloding, context);
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Your Email',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white30,
                              ),
                            ),
                            Textfield(
                                keyboardType: TextInputType.emailAddress,
                                hintText: 'Enter Your Email',
                                isobs: false,
                                textEditingController: emailcontroller),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Password',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white30,
                              ),
                            ),
                            Textfield(
                                keyboardType: TextInputType.emailAddress,
                                hintText: 'Enter Your password',
                                isobs: true,
                                textEditingController: passcontroller),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SignButton(
                            passcontroller: passcontroller,
                            emailcontroller: emailcontroller,
                            namecontroller: namecontroller,
                            username: username,
                            isloding: _isloding,
                            isweb: false,
                            node: node),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Alredy Have an Account?',
                              style: TextStyle(color: Colors.white30),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Loggin()));
                              },
                              child: const Text(
                                'Sign in',
                                style: TextStyle(color: Colors.blue),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Gcontainer().terms(),
                      ]),
                ),
              ),
            ),
            SuggestCard(islodincontainer: islodincontainer)
          ]),
        ),
      ],
    )));
  }
}
