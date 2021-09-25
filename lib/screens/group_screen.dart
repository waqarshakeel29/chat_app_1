// ignore_for_file: prefer_const_constructors

import 'package:chat_app_1/models/message_row_model.dart';
import 'package:chat_app_1/screens/chat_screen.dart';
import 'package:chat_app_1/widgets/chat_row_widget.dart';
import 'package:flutter/material.dart';

import 'group_chat_screen.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({Key? key}) : super(key: key);

  @override
  GroupScreenState createState() {
    return GroupScreenState();
  }
}

class GroupScreenState extends State<GroupScreen> {
  List<MessageRowModel> list = <MessageRowModel>[];
  @override
  void initState() {
    super.initState();

    for (var i = 0; i < 100; i++) {
      list.add(MessageRowModel(
        name: "Friends",
        lastMessage: "What was the spot we visted last time?",
        time: "12:45 pm",
        imageUrl:
            'https://images.unsplash.com/photo-1506869640319-fe1a24fd76dc?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Z3JvdXB8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',
        isRead: true,
      ));
      list.add(MessageRowModel(
        name: "Family",
        lastMessage: "Would you provide me with a template please?",
        time: "12:45 pm",
        imageUrl:
            'https://i.pinimg.com/originals/d4/8c/2d/d48c2de0debd3bef102256f979862bbd.jpg',
        isRead: false,
      ));
      list.add(MessageRowModel(
        name: "Cousins",
        lastMessage: "Hello brother",
        time: "12:45 pm",
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBi7ljNJLrHtLIEbTVA0NSIBCakVcyzcS1wIAF7aKgdj_tPU9Y2oru-g5RwLngD2WIvR4&usqp=CAU',
        isRead: true,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                // shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                // primary: false,
                // shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return MessageRow(
                    name: list[index].name,
                    lastMessage: list[index].lastMessage,
                    time: list[index].time,
                    imageUrl: list[index].imageUrl,
                    isRead: list[index].isRead,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GroupChatScreen()));
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
