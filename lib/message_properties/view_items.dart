// ignore_for_file: dead_code

import 'package:anonymouse_messages/DbStore/DatabaseHelper.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../DbStore/dateFormat/dateTime_format.dart';

class Viewitem extends StatefulWidget {
  final BuildContext parentContext;
  final DocumentSnapshot data;

  const Viewitem({
    Key? key,
    required this.data,
    required this.parentContext,
  }) : super(key: key);

  @override
  _ViewitemState createState() => _ViewitemState();
}

class _ViewitemState extends State<Viewitem> {
  //teste page

  @override
  Widget build(BuildContext context) {
    return messagebody(

        // time: DateFormat.yMMMd().format(widget.data['Timepublise']).toString(),
        time: TimesStamp().readTimestamp(widget.data['Timepublise']).toString(),
        //  readTimestamp(widget.data['Timepublise']).toString(),
        title: widget.data['Message'],
        postid: widget.data['postId']);
  }

  Widget messagebody({
    required String title,
    final postid,
    required String time,
  }) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                style: BorderStyle.solid,
                color: Colors.teal,
              )),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Messages:'),
                      IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => Dialog(
                                    child: ListView(
                                        shrinkWrap: true,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 12),
                                        children: ['Delete']
                                            .map((e) => InkWell(
                                                  onTap: () async {
                                                    DbHelper().delete(postid);
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      vertical: 12,
                                                      horizontal: 16,
                                                    ),
                                                    child: Text(e),
                                                  ),
                                                ))
                                            .toList())));
                          },
                          icon: const Icon(Icons.more_vert))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    style: const TextStyle(fontSize: 15, color: Colors.white54),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text("- Anonymous- [ $time ]"),
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  String getTruncatedTitle(String actualString, int maxLetters) {
    return actualString.length > maxLetters
        ? actualString.substring(0, maxLetters) + "..."
        : actualString;
  }
}
