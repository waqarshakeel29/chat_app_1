// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:chat_app_1/constants/theme.dart';
import 'package:chat_app_1/widgets/status_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  MessageScreenState createState() {
    return MessageScreenState();
  }
}

class MessageScreenState extends State<MessageScreen> {
  bool isTrue = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 15, 5, 0),
      child: Column(
        children: [
          Flexible(
            flex: 1,
            child: StatusList(),
          ),
          Flexible(
            flex: 6,
            child: ListView(
              children: [Text("YO YO"), Text("Hello")],
            ),
          ),
        ],
      ),
    );
  }
}
