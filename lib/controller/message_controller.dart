import 'package:chat_app_1/controller/sign_in_controller.dart';
import 'package:chat_app_1/models/chat_model.dart';
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

  Future<String> getMessages() async {
    String uid = "";
    await FirebaseFirestore.instance
        .collection("messagesUids")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["messageUid"]);
      });
    });

    return uid;
  }

  Future<bool> onSendMessage(
      String content, String imageUrl, String chatUid) async {
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
      messageFromUid: signInController.user!.uid,
    );

    await FirebaseFirestore.instance.runTransaction((transaction) async {
      await transaction.set(
        documentReference,
        newMessage.toJson(),
      );
    });
    return true;
  }
}
