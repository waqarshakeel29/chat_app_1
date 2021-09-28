// ignore_for_file: prefer_const_constructors

import 'package:chat_app_1/constants/theme.dart';
import 'package:chat_app_1/controller/sign_in_controller.dart';
import 'package:chat_app_1/main.dart';
import 'package:chat_app_1/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  SignInScreenState createState() {
    return SignInScreenState();
  }
}

class SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  SignInController signInController = Get.find<SignInController>();

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
              Form(
                key: _formKey,
                child: Column(
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
                    CustomTextField(
                      hint: 'Email',
                      controller: emailController,
                      // validator: (String? value) {
                      //   if (value!.isEmpty) {
                      //     return 'Please enter email';
                      //   }
                      //   return null;
                      // },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    CustomTextField(
                      hint: 'Password',
                      controller: passwordController,
                      obscureText: true,
                      // validator: (String? value) {
                      //   if (value!.isEmpty) {
                      //     return 'Please enter email';
                      //   }
                      //   return null;
                      // },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: InkWell(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            print("TRUE");
                            bool result = await signInController.signIn(
                                emailController.text, passwordController.text);
                            if (result) {
                              emailController.text = "";
                              passwordController.text = "";
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()),
                                  ModalRoute.withName("/Home"));
                            } else {
                              print("NOT SIGN UP");
                            }
                          } else {
                            print("FALSE");
                          }
                          // signInController.signUp(
                          //     emailController.text, passwordController.text);
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
              ),
              SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
