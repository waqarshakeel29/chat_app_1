// ignore_for_file: prefer_const_constructors

import 'package:chat_app_1/constants/theme.dart';
import 'package:chat_app_1/controller/sign_in_controller.dart';
import 'package:chat_app_1/main.dart';
import 'package:chat_app_1/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  SignUpScreenState createState() {
    return SignUpScreenState();
  }
}

class SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  SignInController signInController = Get.find<SignInController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
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
                      'Sign Up',
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
                    hint: 'Name',
                    controller: nameController,
                    // validator: (String? value) {
                    //   if (value!.isEmpty) {
                    //     return 'Please enter name';
                    //   }
                    //   return null;
                    // },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
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
                    //     return 'Please enter password';
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
                          bool result = await signInController.signUp(
                              nameController.text,
                              emailController.text,
                              passwordController.text);
                          if (result) {
                            nameController.text = "";
                            emailController.text = "";
                            passwordController.text = "";
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
            ),
            SizedBox()
          ],
        ),
      ),
    );
  }
}
