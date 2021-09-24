// ignore_for_file: prefer_const_constructors

import 'package:chat_app_1/constants/theme.dart';
import 'package:chat_app_1/main.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  SignUpScreenState createState() {
    return SignUpScreenState();
  }
}

class SignUpScreenState extends State<SignUpScreen> {
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
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: CustomTheme.primary,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
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
                          hintText: 'Name',
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
                    height: MediaQuery.of(context).size.height * 0.04,
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
                          hintText: 'Email',
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
                    height: MediaQuery.of(context).size.height * 0.04,
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
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: CustomTheme.primary,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        // color: CustomTheme.primary,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.07,
                        child: Center(
                          child: Text(
                            'SIGN UP',
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
