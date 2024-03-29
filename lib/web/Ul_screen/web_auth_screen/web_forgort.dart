import 'package:anonymouse_messages/backEnd_connection/forgotConnet_button.dart';
import 'package:anonymouse_messages/web/Ul_screen/web_auth_screen/web_login.dart';
import 'package:flutter/material.dart';
import '../../../common/liner_forder/linergrant.dart';
import '../../../firebase_method/loggin_service/textfild.dart';

class Webforgetpass extends StatefulWidget {
  const Webforgetpass({Key? key}) : super(key: key);

  @override
  State<Webforgetpass> createState() => _WebforgetpassState();
}

final emailcontroller = TextEditingController();
bool isloding = false;

class _WebforgetpassState extends State<Webforgetpass> {
  FocusNode node = FocusNode();
  @override
  void initState() {
    super.initState();
    node.addListener(() {
      if (!node.hasFocus) {
        deletespace();
      }
    });
  }

  void deletespace() {
    emailcontroller.text = emailcontroller.text.replaceAll("", "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.blue, gradient: Gcontainer().lineargrant()),
            child: Stack(
              children: [
                Center(
                  child: Container(
                    height: 600,
                    width: 700,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 22, 0, 27),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: const EdgeInsets.only(
                        left: 15, right: 15, top: 30, bottom: 20),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 40, right: 40, top: 20),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    NetworkImage(Gcontainer().networkimage()),
                                radius: 50,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Forgot Password!',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                " Forgot your password? Don't worry! Reset it here.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white30,
                                ),
                              ),
                              const SizedBox(
                                height: 22,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                    height: 20,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              ForgetConnet(
                                  emailcontroller: emailcontroller,
                                  isloding: isloding,
                                  isweb: true),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                height: 1.9,
                                color: const Color.fromARGB(255, 166, 76, 182),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  width: 300,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(15),
                                      gradient: Gcontainer().buttonLinear()),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  child:
                                      const Center(child: Text('Go Back  <-')),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Remembered the password? ',
                                    style: TextStyle(color: Colors.white30),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const WebLoggin()));
                                    },
                                    child: const Text(
                                      ' Login',
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
                )
              ],
            )),
      ),
    );
  }
}
