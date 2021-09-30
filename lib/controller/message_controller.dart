import 'dart:convert';

import 'package:chat_app_1/controller/sign_in_controller.dart';
import 'package:chat_app_1/models/chat_model.dart';
import 'package:chat_app_1/models/message_row_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class MessageController extends GetxController {
  SignInController signInController = Get.find<SignInController>();
  @override
  void onInit() {
    super.onInit();
  }

  Future<String> getMessageUid(String memberUid) async {
    String uid = "";
    await FirebaseFirestore.instance
        .collection("messagesUids")
        .doc(signInController.user!.uid + "-" + memberUid)
        .get()
        .then((value) async {
      if (value.data() != null) {
        uid = value.data()!["messageUid"];
      } else {
        String messageUid = const Uuid().v1();
        await FirebaseFirestore.instance.collection("messages").doc(messageUid)
            // .collection("chat")
            // .get();

            .set({"chat": FieldValue.arrayUnion([])}).then((_) async {
          // FieldValue.arrayUnion([])
          await FirebaseFirestore.instance
              .collection("messagesUids")
              .doc(memberUid + "-" + signInController.user!.uid)
              .set({"messageUid": messageUid}).then((_) async {});
          await FirebaseFirestore.instance
              .collection("messagesUids")
              .doc(signInController.user!.uid + "-" + memberUid)
              .set({"messageUid": messageUid}).then((_) async {});
          uid = messageUid;
        });
      }
    });
    return uid;
  }

  Future<List<MessageRowModel>> getMessages() async {
    String uid = "";
    var lastMessageList = <MessageRowModel>[];
    // print(signInController.user!.uid);
    return await FirebaseFirestore.instance
        .collection("lastMessages")
        .where("senderUid", isEqualTo: signInController.user!.uid)
        .get()
        .then((QuerySnapshot snapshot) {
      // print(snapshot.size);
      return FirebaseFirestore.instance
          .collection("lastMessages")
          .where("receiverUid", isEqualTo: signInController.user!.uid)
          .get()
          .then((QuerySnapshot snapshot2) {
        var list = snapshot.docs;
        list.addAll(snapshot2.docs);

        var timeList = <String>[];
        for (var element in list) {
          ChatModel lastMessage =
              ChatModel.fromJson(element.data() as Map<String, dynamic>);
          if (!timeList.contains(lastMessage.timestamp)) {
            lastMessageList.add(MessageRowModel(
                name: lastMessage.name,
                lastMessage: lastMessage.message,
                time: lastMessage.timestamp,
                imageUrl: lastMessage.imageUrl));
            timeList.add(lastMessage.timestamp);
          }
        }
        print("RETURN VALUE");
        print(lastMessageList);
        return lastMessageList;
      });
    });
    // print("RETURN VALUE");
    // print(lastMessageList);
    // return lastMessageList;
  }

  Future<bool> onSendMessage(
      String content, String imageUrl, String chatUid, String memberUid) async {
    // type: 0 = text, 1 = image, 2 = sticker

    String time = DateTime.now().millisecondsSinceEpoch.toString();
    var documentReference = FirebaseFirestore.instance
        .collection('messages')
        .doc(chatUid)
        .collection("chat")
        .doc(time);

    ChatModel newMessage = ChatModel(
        name: signInController.user!.displayName!,
        message: content,
        imageUrl: imageUrl,
        timestamp: time,
        senderUid: signInController.user!.uid,
        receiverUid: memberUid);

    await FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.set(
        documentReference,
        newMessage.toJson(),
      );
      FirebaseFirestore.instance
          .collection('lastMessages')
          .doc(signInController.user!.uid + "-" + memberUid)
          // .collection(memberUid)
          // .doc("1")
          .set(newMessage.toJson());

      FirebaseFirestore.instance
          .collection('lastMessages')
          .doc(memberUid + "-" + signInController.user!.uid)
          // .collection(signInController.user!.uid)
          // .doc("1")
          .set(newMessage.toJson());
    });

    return true;
  }
}
