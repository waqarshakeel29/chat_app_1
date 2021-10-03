// ignore_for_file: prefer_const_constructors

import 'package:chat_app_1/constants/theme.dart';
import 'package:chat_app_1/controller/sign_in_controller.dart';
import 'package:chat_app_1/models/chat_model.dart';
import 'package:chat_app_1/widgets/group_receive_message_bubble.dart';
import 'package:chat_app_1/widgets/group_send_message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class GroupChatScreen extends StatefulWidget {
  const GroupChatScreen({Key? key}) : super(key: key);

  @override
  GroupChatScreenState createState() {
    return GroupChatScreenState();
  }
}

class GroupChatScreenState extends State<GroupChatScreen> {
  ScrollController scrollController = ScrollController();
  TextEditingController messageController = TextEditingController();

  SignInController signInController = Get.find<SignInController>();
  List<ChatModel> list = <ChatModel>[];
  @override
  void initState() {
    super.initState();

    for (var i = 0; i < 3; i++) {
      list.add(ChatModel(
        name: "Alex Dean",
        message: "hello",
        timestamp: "12:45 pm",
        senderUid: "1",
        receiverUid: "2",
        imageUrl:
            'https://images.unsplash.com/photo-1541577141970-eebc83ebe30e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fG1hbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',
      ));
      list.add(ChatModel(
        name: "Macy Mason",
        message: "Wow, thats great. Wish you good luck brother.",
        timestamp: "12:45 pm",
        senderUid: "2",
        receiverUid: "1",
        imageUrl:
            'https://static.projectmanagement.com/images/profile-photos/47440204_070121020946_p.jpg',
      ));
      list.add(ChatModel(
        name: "Alex Dean",
        message:
            "That perfect. I am going to get increment this month and im actually very excited!!!",
        timestamp: "12:45 pm",
        senderUid: "1",
        receiverUid: "2",
        imageUrl:
            'https://images.unsplash.com/photo-1541577141970-eebc83ebe30e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fG1hbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',
      ));
      list.add(ChatModel(
        name: "Macy Mason",
        message: "Hi, I am fine. What about you? How's job going?",
        timestamp: "12:45 pm",
        senderUid: "2",
        receiverUid: "1",
        imageUrl:
            'https://static.projectmanagement.com/images/profile-photos/47440204_070121020946_p.jpg',
      ));
      list.add(ChatModel(
        name: "Alex Dean",
        message: "Hello this is waqar. How are you?",
        timestamp: "12:45 pm",
        senderUid: "1",
        receiverUid: "2",
        imageUrl:
            'https://images.unsplash.com/photo-1541577141970-eebc83ebe30e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fG1hbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        elevation: 0,
        backgroundColor: CustomTheme.primary,
        title: const Text(
          'Friends',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: const [
          Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.search,
                size: 28,
              )),
          Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.call,
                size: 28,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  controller: scrollController,
                  reverse: true,
                  shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  // primary: false,
                  // shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return list[index].senderUid != signInController.user!.uid
                        ? GroupReceivedMessageBubble(
                            message: list[index].message,
                          )
                        : GroupSendMessageBubble(
                            message: list[index].message,
                          );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 5),
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: buildMessageTextField(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMessageTextField() {
    return SizedBox(
      height: 50.0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: CustomTheme.light,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: TextField(
                controller: messageController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Write your reply...',
                  contentPadding: EdgeInsets.only(left: 20.0, right: 20.0),
                  hintStyle: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black54,
                  ),
                ),
                textInputAction: TextInputAction.send,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
                onSubmitted: (_) {
                  addNewMessage();
                },
              ),
            ),
          ),
          SizedBox(
            width: 50.0,
            child: GestureDetector(
              onTap: addNewMessage,
              child: CircleAvatar(
                backgroundColor: CustomTheme.primary,
                child: Icon(
                  Icons.send,
                  size: 23,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void addNewMessage() {
    if (messageController.text.trim().isNotEmpty) {
      ChatModel newMessage = ChatModel(
        name: "Alex",
        message: messageController.text,
        imageUrl:
            'https://images.unsplash.com/photo-1541577141970-eebc83ebe30e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fG1hbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',
        timestamp: "12:45 pm",
        senderUid: "1",
        receiverUid: "2",
      );

      setState(() {
        list.insert(0, newMessage);
        messageController.text = '';
      });
      // Timer(
      //     Duration(milliseconds: 500),
      //     () => scrollController
      //         .jumpTo(scrollController.position.maxScrollExtent));
    }
  }
}
