// ignore_for_file: prefer_const_constructors

import 'package:chat_app_1/constants/theme.dart';
import 'package:chat_app_1/models/call_row_model.dart';
import 'package:flutter/material.dart';

class CallRow extends StatefulWidget {
  final String name;
  final String time;
  final String imageUrl;
  final CallStatus callStatus;

  const CallRow(
      {Key? key,
      required this.name,
      required this.time,
      required this.imageUrl,
      required this.callStatus})
      : super(key: key);

  @override
  CallRowState createState() {
    return CallRowState();
  }
}

class CallRowState extends State<CallRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 28,
            backgroundColor: CustomTheme.primary,
            backgroundImage: NetworkImage(widget.imageUrl),
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Icon(
                    widget.callStatus == CallStatus.received
                        ? Icons.call_received
                        : Icons.call_missed,
                    size: 20,
                    color: widget.callStatus == CallStatus.received
                        ? Colors.green
                        : Colors.red,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.time,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )),
        Padding(
          padding: const EdgeInsets.only(top: 18, right: 8),
          child: Icon(
            Icons.call,
            color: CustomTheme.primary,
          ),
        ),
      ],
    );
  }
}
