import 'package:chat_app_1/models/member_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class MembersController extends GetxController {
  var products = <MemberModel>[];

  @override
  void onInit() {
    super.onInit();
  }

  Future<List<MemberModel>> fetchMembers() async {
    var list = <MemberModel>[];
    await FirebaseFirestore.instance
        .collection("users")
        .get()
        .then((QuerySnapshot snapshot) => snapshot.docs.forEach((member) {
              // MemberModel? memberModel = member.get("name");
              // print(member.get("name"));
              list.add(MemberModel(
                  // imageUrl: member.get("imageUrl") ??
                  imageUrl:
                      'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                  name: member.get("name"),
                  uid: member.get("uid")));
            }));

    return list;

    // print(querySnapshot);
    // var list = <MemberModel>[];

    // for (int i = 0; i < querySnapshot.docs.length; i++) {
    //   list.add(MemberModel(imageUrl: querySnapshot.docs., name: name, uid: uid));
    // }
    // return querySnapshot.docs;
  }
}
