// ignore_for_file: prefer_const_constructors

import 'package:chat_app_1/constants/theme.dart';
import 'package:chat_app_1/screens/sign_in_screen.dart';
import 'package:chat_app_1/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

class SignSelectionScreen extends StatefulWidget {
  const SignSelectionScreen({Key? key}) : super(key: key);

  @override
  SignSelectionScreenState createState() {
    return SignSelectionScreenState();
  }
}

class SignSelectionScreenState extends State<SignSelectionScreen> {
  ScrollController scrollController = ScrollController();
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // shrinkWrap: true,
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.45,
                child: Image(image: AssetImage("assets/chat_onboard.png"))),
            Column(
              children: [
                Center(
                  child: Text(
                    'Welcome to WeGossip',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: CustomTheme.primary,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Center(
                  child: Text(
                    'Connect with loved ones',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignInScreen()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: CustomTheme.primary,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: CustomTheme.light,
                        border:
                            Border.all(width: 1, color: CustomTheme.primary),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    // color: CustomTheme.primary,
                    width: MediaQuery.of(context).size.width * 0.83,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: Center(
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: CustomTheme.primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
