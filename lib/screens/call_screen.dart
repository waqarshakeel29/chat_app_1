import 'package:chat_app_1/constants/theme.dart';
import 'package:chat_app_1/models/call_row_model.dart';
import 'package:chat_app_1/widgets/call_row_widget.dart';
import 'package:flutter/material.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({Key? key}) : super(key: key);

  @override
  CallScreenState createState() {
    return CallScreenState();
  }
}

class CallScreenState extends State<CallScreen> {
  List<CallRowModel> list = <CallRowModel>[];
  @override
  void initState() {
    super.initState();

    for (var i = 0; i < 100; i++) {
      list.add(CallRowModel(
        name: "Alex Dean",
        time: "3m ago",
        callStatus: CallStatus.missed,
        imageUrl:
            'https://images.unsplash.com/photo-1541577141970-eebc83ebe30e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fG1hbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',
      ));
      list.add(CallRowModel(
        name: "Macy Mason",
        time: "Yesterday",
        callStatus: CallStatus.received,
        imageUrl:
            'https://static.projectmanagement.com/images/profile-photos/47440204_070121020946_p.jpg',
      ));
      list.add(CallRowModel(
        name: "Waqas Shakeel",
        time: "24 July",
        callStatus: CallStatus.received,
        imageUrl:
            'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: ListView.builder(
          // shrinkWrap: true,
          // physics: NeverScrollableScrollPhysics(),
          primary: false,
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (context, index) {
            return CallRow(
                name: list[index].name,
                time: list[index].time,
                imageUrl: list[index].imageUrl,
                callStatus: list[index].callStatus);
          }),
    );
  }
}
