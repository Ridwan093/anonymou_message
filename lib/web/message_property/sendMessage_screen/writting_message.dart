// ignore_for_file: camel_case_types

import 'package:anonymouse_messages/backEnd_connection/message_buttons/post_message_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../common/custormise_filed/message_filed.dart';
import '../../../common/liner_forder/linergrant.dart';

import '../../../UI_screen/message_layout/sendMessage_screen/writing_post.dart';


class Web_post_message extends StatefulWidget {
  const Web_post_message({Key? key}) : super(key: key);

  @override
  State<Web_post_message> createState() => _Web_post_messageState();
}



bool isloding = false;
final webmessagecontroller = TextEditingController();

class _Web_post_messageState extends State<Web_post_message> {
  systemnavigato() {
    SystemNavigator.pop();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return systemnavigato();
      },
      child: Scaffold(
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
                                'Say Something..',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Say Somthing About Me',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white30,
                                    ),
                                  ),
                                  CustomiseField(
                                    keyboardType: TextInputType.name,
                                    hintText: '254 characters remaining',
                                    maxLength: 252,
                                    maxLines: 7,
                                    controller: webmessagecontroller,
                                    iscont: true,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'put Ur Friend Name Here!',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white30,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              PostMessageButton(
                                  messagecontroller: webmessagecontroller,
                                  isloding: isloding),
                              const SizedBox(
                                height: 10,
                              ),
                              Gcontainer().terms(),
                              const SizedBox(
                                height: 10,
                              ),
                            ]),
                      ),
                    ),
                  )),
                  Positioned(
                      top: 100,
                      child: !islodinOTP
                          ? Container(
                              height: 200,
                              width: 300,
                              color: Colors.cyanAccent,
                              child: Center(
                                child: InkWell(
                                    child: const Text('set Container to false'),
                                    onTap: () {
                                      setState(() {
                                        islodinOTP = false;
                                      });
                                    }),
                              ),
                            )
                          : Container())
                ],
              )),
        ),
      ),
    );
  }
}
