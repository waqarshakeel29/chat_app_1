import 'package:flutter/material.dart';

class TabHeadingText extends StatelessWidget {
  final String heading;
  const TabHeadingText({Key? key, required this.heading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      heading,
      style: const TextStyle(fontSize: 18, color: Colors.white),
    );
  }
}
