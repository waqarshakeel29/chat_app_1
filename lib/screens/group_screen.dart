// ignore_for_file: prefer_const_constructors

import 'package:chat_app_1/constants/theme.dart';
import 'package:chat_app_1/models/chat_group_row_model.dart';
import 'package:flutter/material.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({Key? key}) : super(key: key);

  @override
  GroupScreenState createState() {
    return GroupScreenState();
  }
}

class GroupScreenState extends State<GroupScreen> {
  List<ChatGroupRowModel> list = <ChatGroupRowModel>[];
  @override
  void initState() {
    super.initState();

    for (var i = 0; i < 2; i++) {
      list.add(ChatGroupRowModel(
        name: "Family",
        memberCount: 1,
        imageUrl:
            'https://images.unsplash.com/photo-1541577141970-eebc83ebe30e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fG1hbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',

        // isRead: true,
      ));

      list.add(ChatGroupRowModel(
        name: "Cousins and Friends",
        memberCount: 2,
        imageUrl:
            'https://static.projectmanagement.com/images/profile-photos/47440204_070121020946_p.jpg',

        // isRead: true,
      ));

      list.add(ChatGroupRowModel(
        name: "Destruction **",
        memberCount: 3,
        imageUrl:
            'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',

        // isRead: true,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          // shrinkWrap: true,
          // physics: NeverScrollableScrollPhysics(),
          primary: false,
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Card(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Icon(
                            Icons.star,
                            color: Colors.amber,
                          )),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  NetworkImage(list[index].imageUrl),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: CircleAvatar(
                                radius: 8,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 6,
                                  backgroundColor: CustomTheme.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          list[index].name,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Stack(
                            // alignment: FractionalOffset.center,
                            children: stackedWidget(
                                list[index].memberCount, list[index].imageUrl))
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  stackedWidget(membersCount, imageUrl) {
    var widgetList = <Widget>[];
    double step = 0;
    Widget widget = Container();
    for (var i = 0; i < membersCount; i++) {
      widget = Padding(
        padding: EdgeInsets.only(left: step),
        child: CircleAvatar(
          radius: 15,
          backgroundColor: Colors.white,
          child: CircleAvatar(
              radius: 14,
              backgroundColor: Colors.red,
              backgroundImage: NetworkImage(
                imageUrl,
              )),
        ),
      );
      step = step + 15;
      widgetList.add(widget);
    }
    return widgetList;
  }
}
