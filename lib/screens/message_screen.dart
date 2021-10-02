// ignore_for_file: prefer_const_constructors

import 'package:chat_app_1/controller/message_controller.dart';
import 'package:chat_app_1/models/message_row_model.dart';
import 'package:chat_app_1/screens/chat_screen.dart';
import 'package:chat_app_1/screens/members_screen.dart';
import 'package:chat_app_1/widgets/chat_row_widget.dart';
import 'package:chat_app_1/widgets/status_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  MessageScreenState createState() {
    return MessageScreenState();
  }
}

class MessageScreenState extends State<MessageScreen> {
  MessageController messageController = Get.find<MessageController>();

  List<MessageRowModel> list = <MessageRowModel>[];
  @override
  void initState() {
    super.initState();

    for (var i = 0; i < 100; i++) {
      list.add(MessageRowModel(
        name: "Alex Dean",
        lastMessage: "What was the spot we visted last time?",
        time: "12:45 pm",
        imageUrl:
            'https://images.unsplash.com/photo-1541577141970-eebc83ebe30e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fG1hbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',
        isRead: true,
      ));
      list.add(MessageRowModel(
        name: "Macy Mason",
        lastMessage: "Would you provide me with a template please?",
        time: "12:45 pm",
        imageUrl:
            'https://static.projectmanagement.com/images/profile-photos/47440204_070121020946_p.jpg',
        isRead: false,
      ));
      list.add(MessageRowModel(
        name: "Waqas Shakeel",
        lastMessage: "Hello brother",
        time: "12:45 pm",
        imageUrl:
            'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        isRead: true,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Column(
            children: [
              SizedBox(height: 115, child: StatusList()),
              Expanded(
                child: FutureBuilder(
                    future: messageController.getMessages(),
                    builder: (context, snapshot) {
                      List<MessageRowModel>? messagesList = null;
                      if (snapshot.hasData) {
                        messagesList = snapshot.data as List<MessageRowModel>;
                        print("DATA1");
                        print(snapshot.data);
                        print("DATA2");
                        print(messagesList);
                      }
                      return snapshot.hasData
                          ? ListView.builder(
                              // shrinkWrap: true,
                              // physics: NeverScrollableScrollPhysics(),
                              // primary: false,
                              // shrinkWrap: true,
                              itemCount: messagesList!.length,
                              itemBuilder: (context, index) {
                                return MessageRow(
                                  name: messagesList![index].name,
                                  lastMessage: messagesList[index].lastMessage,
                                  time: DateFormat('dd MMM kk:mm a').format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          int.parse(messagesList[index].time))),
                                  imageUrl: messagesList[index].imageUrl,
                                  isRead: messagesList[index].isRead,
                                  onTap: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => ChatScreen(
                                    //               chatUid: "",
                                    //             )));
                                  },
                                );
                              })
                          : CircularProgressIndicator();
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                  child: Icon(
                    Icons.message,
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    // await messageController.getMessages();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MembersScreen()));
                  })),
        )
      ],
    );
  }
}
