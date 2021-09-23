// ignore_for_file: prefer_const_constructors

import 'package:chat_app_1/constants/theme.dart';
import 'package:chat_app_1/models/chat_model.dart';
import 'package:chat_app_1/widgets/receive_message_bubble.dart';
import 'package:chat_app_1/widgets/send_message_bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  SignInScreenState createState() {
    return SignInScreenState();
  }
}

class SignInScreenState extends State<SignInScreen> {
  ScrollController scrollController = ScrollController();
  TextEditingController messageController = TextEditingController();
  List<ChatModel> list = <ChatModel>[];
  @override
  void initState() {
    super.initState();

    for (var i = 0; i < 3; i++) {
      list.add(ChatModel(
        name: "Alex Dean",
        message: "hello",
        time: "12:45 pm",
        messageFrom: MessageFrom.me,
        imageUrl:
            'https://images.unsplash.com/photo-1541577141970-eebc83ebe30e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fG1hbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',
      ));
      list.add(ChatModel(
        name: "Macy Mason",
        message: "Wow, thats great. Wish you good luck brother.",
        time: "12:45 pm",
        messageFrom: MessageFrom.notMe,
        imageUrl:
            'https://static.projectmanagement.com/images/profile-photos/47440204_070121020946_p.jpg',
      ));
      list.add(ChatModel(
        name: "Alex Dean",
        message:
            "That perfect. I am going to get increment this month and im actually very excited!!!",
        time: "12:45 pm",
        messageFrom: MessageFrom.me,
        imageUrl:
            'https://images.unsplash.com/photo-1541577141970-eebc83ebe30e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fG1hbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',
      ));
      list.add(ChatModel(
        name: "Macy Mason",
        message: "Hi, I am fine. What about you? How's job going?",
        time: "12:45 pm",
        messageFrom: MessageFrom.notMe,
        imageUrl:
            'https://static.projectmanagement.com/images/profile-photos/47440204_070121020946_p.jpg',
      ));
      list.add(ChatModel(
        name: "Alex Dean",
        message: "Hello this is waqar. How are you?",
        time: "12:45 pm",
        messageFrom: MessageFrom.me,
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
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: CustomTheme.primary,
        ),
      ),
      body: Stack(
        children: [
          // Container(
          //   decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //       begin: Alignment.topRight,
          //       end: Alignment(
          //           0.0, 1), // 10% of the width, so there are ten blinds.
          //       colors: <Color>[
          //         CustomTheme.primary,
          //         Colors.white,
          //       ], // red to yellow
          //       // tileMode:
          //       //     TileMode.repeated, // repeats the gradient over the canvas
          //     ),
          //   ),
          // ),

          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: CustomTheme.primary,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: CustomTheme.borderColor),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: Offset(1, 7), // changes position of shadow
                          ),
                        ],
                        color: CustomTheme.primary.withOpacity(0.9),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Center(
                      child: TextField(
                        controller: messageController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Username or email',
                          contentPadding:
                              EdgeInsets.only(left: 20.0, right: 20.0),
                          hintStyle: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                        textInputAction: TextInputAction.send,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                        onSubmitted: (_) {
                          addNewMessage();
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2, color: CustomTheme.borderColor),
                        color: CustomTheme.light,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Center(
                      child: TextField(
                        controller: messageController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          contentPadding:
                              EdgeInsets.only(left: 20.0, right: 20.0),
                          hintStyle: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
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
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Text(
                    'Forget Passowrd?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: CustomTheme.primary,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: CustomTheme.primary,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      // color: CustomTheme.primary,
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: Center(
                        child: Text(
                          'SIGN IN',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: CustomTheme.light,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'OR',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: CustomTheme.primary,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: CustomTheme.primary,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      // color: CustomTheme.primary,
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: Center(
                        child: Text(
                          'SIGN IN',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: CustomTheme.light,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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
          time: "now",
          messageFrom: MessageFrom.me);

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
