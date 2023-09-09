// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class SuggestCard extends StatefulWidget {
  bool islodincontainer;
  SuggestCard({super.key, required this.islodincontainer});

  @override
  State<SuggestCard> createState() => _SuggestCardState();
}

class _SuggestCardState extends State<SuggestCard> {
  Widget playContainer() {
    return Positioned(
      top: 80,
      left: 10,
      right: 10,
      child: widget.islodincontainer
          ? Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              height: 150,
              color: const Color.fromARGB(255, 255, 224, 129),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'How to play?',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 88, 73, 25)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      height: 1.9,
                      color: const Color.fromARGB(255, 166, 76, 182),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '-> Regester your Account NOW!👇👇👇',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 26, 206, 32)),
                    ),
                    const Text(
                      '-> shear your dere Link with others',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 26, 206, 32)),
                    ),
                    const Text(
                      "-> Recieve anonymous compliments and '",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 26, 206, 32)),
                    ),
                    const Text(
                      " secreet messages from your friends'",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 26, 206, 32)),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12, right: 10),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 209, 32, 19),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2.0,
                                  blurRadius: 3.0,
                                  color: Colors.cyan)
                            ]),
                        height: 36,
                        width: 36,
                        child: Center(
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  widget.islodincontainer = false;
                                });
                              },
                              icon: const Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 20,
                              )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          : Container(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
