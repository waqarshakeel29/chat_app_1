// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:chat_app_1/constants/theme.dart';
import 'package:chat_app_1/models/chat_person_row_model.dart';
import 'package:chat_app_1/widgets/chat_person_row.dart';
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
  List<ChatPersonRowModel> list = <ChatPersonRowModel>[];
  @override
  void initState() {
    super.initState();

    for (var i = 0; i < 100; i++) {
      list.add(ChatPersonRowModel(
        name: "Alex Dean",
        lastMessage: "What was the spot we visted last time?",
        time: "3m ago",
        imageUrl:
            'https://images.unsplash.com/photo-1541577141970-eebc83ebe30e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fG1hbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',
        isRead: true,
      ));
      list.add(ChatPersonRowModel(
        name: "Macy Mason",
        lastMessage: "Would you provide me with a template please?",
        time: "3m ago",
        imageUrl:
            'https://static.projectmanagement.com/images/profile-photos/47440204_070121020946_p.jpg',
        isRead: false,
      ));
      list.add(ChatPersonRowModel(
        name: "Waqas Shakeel",
        lastMessage: "Hello brother",
        time: "3m ago",
        imageUrl:
            'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        isRead: true,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: StatusList(),
              ),
              Flexible(
                flex: 7,
                child: ListView.builder(
                    // shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    primary: false,
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return ChatPersonRow(
                        name: list[index].name,
                        lastMessage: list[index].lastMessage,
                        time: list[index].time,
                        imageUrl: list[index].imageUrl,
                        isRead: list[index].isRead,
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
