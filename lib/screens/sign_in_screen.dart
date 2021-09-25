// ignore_for_file: prefer_const_constructors

import 'package:chat_app_1/constants/theme.dart';
import 'package:chat_app_1/main.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // shrinkWrap: true,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 40,
                  color: CustomTheme.primary,
                ),
              ),
              Center(
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Image(image: AssetImage("assets/chat_onboard.png"))),
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: CustomTheme.primary,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.07,
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
                        color: CustomTheme.light,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Center(
                      child: TextField(
                        controller: messageController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Username or Email',
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
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.07,
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
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                            ModalRoute.withName("/Home"));
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => HomeScreen()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: CustomTheme.primary,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        // color: CustomTheme.primary,
                        width: MediaQuery.of(context).size.width * 0.83,
                        height: MediaQuery.of(context).size.height * 0.07,
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
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Text(
                    'Forget Passowrd?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: CustomTheme.primary,
                    ),
                  ),
                ],
              ),
              SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
