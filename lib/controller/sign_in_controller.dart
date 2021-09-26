import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  // var products = List<Product>().obs;
  User? user;

  @override
  void onInit() {
    super.onInit();
    user = null;
  }

  Future<bool> signIn(email, password) async {
    UserCredential? userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    if (userCredential.user != null) {
      print(userCredential.user!.displayName);
      print(userCredential.user!.email);
      user = userCredential.user;
      return true;
    } else {
      print("not sign in");
      return false;
    }
  }

  Future<bool> signUp(String name, String email, String password) async {
    final User? user =
        (await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ))
            .user;
    if (user != null) {
      // user.updateDisplayName(name);
      user.updateDisplayName(name).then((value) {
        print("Profile has been changed successfully");
      }).catchError((e) {
        print("There was an error updating profile");
      });

      FirebaseFirestore.instance.collection("users").doc(user.uid).set({
        "uid": user.uid,
        "name": name,
        "email": email,
      });
      this.user = user;
      print(this.user);
      return true;
    } else {
      return false;
    }
  }
}
