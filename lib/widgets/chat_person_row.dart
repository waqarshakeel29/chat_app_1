// ignore_for_file: prefer_const_constructors

import 'package:chat_app_1/constants/theme.dart';
import 'package:chat_app_1/models/status_model.dart';
import 'package:chat_app_1/widgets/status_cricle_widget.dart';
import 'package:flutter/material.dart';

class ChatPersonRow extends StatefulWidget {
  final String name;
  final String lastMessage;
  final String time;
  final String imageUrl;
  bool isRead;

  ChatPersonRow(
      {Key? key,
      required this.name,
      required this.lastMessage,
      required this.time,
      required this.imageUrl,
      this.isRead = true})
      : super(key: key);

  @override
  ChatPersonRowState createState() {
    return ChatPersonRowState();
  }
}

class ChatPersonRowState extends State<ChatPersonRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage(widget.imageUrl),
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    widget.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight:
                            widget.isRead ? FontWeight.normal : FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  widget.isRead
                      ? Container()
                      : Align(
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            radius: 4,
                            backgroundColor: CustomTheme.primary,
                          ),
                        )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                widget.lastMessage,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight:
                      widget.isRead ? FontWeight.normal : FontWeight.bold,
                ),
              ),
            ],
          ),
        )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.time,
            maxLines: 1,
            style: TextStyle(
              color: Colors.black,
              fontWeight: widget.isRead ? FontWeight.normal : FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
