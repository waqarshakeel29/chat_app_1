import 'package:chat_app_1/constants/theme.dart';
import 'package:chat_app_1/models/call_row_model.dart';
import 'package:chat_app_1/models/chat_person_row_model.dart';
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
        callStatus: CallStatus.MISSED,
        imageUrl:
            'https://images.unsplash.com/photo-1541577141970-eebc83ebe30e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fG1hbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',
      ));
      list.add(CallRowModel(
        name: "Macy Mason",
        time: "Yesterday",
        callStatus: CallStatus.RECEIVED,
        imageUrl:
            'https://static.projectmanagement.com/images/profile-photos/47440204_070121020946_p.jpg',
      ));
      list.add(CallRowModel(
        name: "Waqas Shakeel",
        time: "24 July",
        callStatus: CallStatus.RECEIVED,
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
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(list[index].imageUrl),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        list[index].name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            list[index].callStatus == CallStatus.RECEIVED
                                ? Icons.call_received
                                : Icons.call_missed,
                            size: 20,
                            color: list[index].callStatus == CallStatus.RECEIVED
                                ? Colors.green
                                : Colors.red,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            list[index].time,
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
          }),
    );
  }
}
