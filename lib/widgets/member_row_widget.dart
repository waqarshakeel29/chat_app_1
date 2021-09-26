// ignore_for_file: prefer_const_constructors

import 'package:chat_app_1/constants/theme.dart';
import 'package:flutter/material.dart';

class MemberRow extends StatefulWidget {
  final String name;
  final String imageUrl;
  final VoidCallback onTap;

  const MemberRow(
      {Key? key,
      required this.name,
      required this.imageUrl,
      required this.onTap})
      : super(key: key);

  @override
  MemberRowState createState() {
    return MemberRowState();
  }
}

class MemberRowState extends State<MemberRow> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: CustomTheme.primary,
              backgroundImage: NetworkImage(widget.imageUrl),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  widget.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 18),
                ),
              ],
            ),
          )),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Icon(
              Icons.chat,
              color: CustomTheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
