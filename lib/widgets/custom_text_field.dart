import 'package:chat_app_1/constants/theme.dart';
import 'package:flutter/material.dart';

typedef StringToVoidFunc = String? Function(String?);

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool obscureText;
  // final StringToVoidFunc validator;

  const CustomTextField(
      {Key? key,
      required this.hint,
      required this.controller,
      // required this.validator,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: CustomTheme.borderColor),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(1, 7), // changes position of shadow
            ),
          ],
          color: CustomTheme.light,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Center(
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          // validator: validator,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            contentPadding: const EdgeInsets.only(left: 20.0, right: 20.0),
            hintStyle: const TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
          textInputAction: TextInputAction.send,
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
