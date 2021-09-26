// ignore_for_file: prefer_const_constructors

import 'package:chat_app_1/constants/theme.dart';
import 'package:chat_app_1/controller/members_controller.dart';
import 'package:chat_app_1/controller/message_controller.dart';
import 'package:chat_app_1/controller/sign_in_controller.dart';
import 'package:chat_app_1/models/member_model.dart';
import 'package:chat_app_1/widgets/member_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chat_screen.dart';

class MembersScreen extends StatefulWidget {
  const MembersScreen({Key? key}) : super(key: key);

  @override
  MembersScreenState createState() {
    return MembersScreenState();
  }
}

class MembersScreenState extends State<MembersScreen> {
  // List<MemberModel> list = <MemberModel>[];

  SignInController signInController = Get.find<SignInController>();

  MembersController membersController = Get.find<MembersController>();
  MessageController messageController = Get.find<MessageController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          shadowColor: Colors.transparent,
          elevation: 0,
          backgroundColor: CustomTheme.primary,
          title: const Text(
            'Members',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: false,
          actions: const [
            Padding(
                padding: EdgeInsets.only(right: 15),
                child: Icon(
                  Icons.search,
                  size: 28,
                )),
          ],
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Column(
                children: [
                  Expanded(
                    child: FutureBuilder(
                        future: membersController.fetchMembers(),
                        builder:
                            (_, AsyncSnapshot<List<MemberModel>> snapshot) {
                          return snapshot.hasData
                              ? ListView.builder(
                                  // shrinkWrap: true,
                                  // physics: NeverScrollableScrollPhysics(),
                                  // primary: false,
                                  // shrinkWrap: true,
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    return MemberRow(
                                      name: snapshot.data![index].name,
                                      imageUrl: snapshot.data![index].imageUrl,
                                      onTap: () async {
                                        if (signInController.user!.uid !=
                                            snapshot.data![index].uid) {
                                          var uid = await messageController
                                              .getMessageUid(
                                                  snapshot.data![index].uid);
                                          print(uid);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ChatScreen(
                                                        chatUid: uid,
                                                      )));
                                        }
                                      },
                                    );
                                  })
                              : Center(
                                  child: CircularProgressIndicator(
                                  color: CustomTheme.primary,
                                ));
                        }),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
