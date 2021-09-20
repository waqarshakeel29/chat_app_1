// ignore_for_file: prefer_const_constructors

import 'package:chat_app_1/models/status_model.dart';
import 'package:chat_app_1/widgets/status_cricle_widget.dart';
import 'package:flutter/material.dart';

class StatusList extends StatefulWidget {
  const StatusList({Key? key}) : super(key: key);

  @override
  StatusListState createState() {
    return StatusListState();
  }
}

class StatusListState extends State<StatusList> {
  List<StatusModel> statusList = <StatusModel>[];

  @override
  initState() {
    super.initState();

    statusList.add(StatusModel(
        name: "Your Story",
        isViewed: false,
        isOnline: true,
        imageUrl:
            'https://images.unsplash.com/photo-1541577141970-eebc83ebe30e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fG1hbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'));

    statusList.add(StatusModel(
        name: "Alex Dean",
        isViewed: false,
        isOnline: false,
        imageUrl:
            'https://images.unsplash.com/photo-1541577141970-eebc83ebe30e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fG1hbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'));

    statusList.add(StatusModel(
        name: "Macy Mason",
        isViewed: true,
        isOnline: true,
        imageUrl:
            'https://static.projectmanagement.com/images/profile-photos/47440204_070121020946_p.jpg'));

    statusList.add(StatusModel(
        name: "Waqas Shakeel",
        isViewed: false,
        isOnline: true,
        imageUrl:
            'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'));

    statusList.add(StatusModel(
        name: "Alex Dean",
        isViewed: true,
        isOnline: false,
        imageUrl:
            'https://images.unsplash.com/photo-1541577141970-eebc83ebe30e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fG1hbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: statusList.length,
        itemBuilder: (context, index) {
          return index == 0
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: CircleAvatar(
                        radius: 32,
                        backgroundColor: Colors.grey.shade300,
                        child: const Icon(
                          Icons.add,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    // Text(
                    //   statusList[index].name,
                    //   style: TextStyle(
                    //       color: Colors.black, fontWeight: FontWeight.bold),
                    // )
                  ],
                )
              : Column(
                  children: [
                    StatusCircle(
                      isViewed: statusList[index].isViewed,
                      isOnline: statusList[index].isOnline,
                      imageUrl: statusList[index].imageUrl,
                      name: statusList[index].name,
                    ),
                    // Text(
                    //   statusList[index].name,
                    //   style: TextStyle(
                    //       color: Colors.black, fontWeight: FontWeight.bold),
                    // )
                  ],
                );
        });
  }
}
