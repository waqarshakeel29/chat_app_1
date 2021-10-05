// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'dart:math';

import 'package:chat_app_1/constants/theme.dart';
import 'package:chat_app_1/controller/message_controller.dart';
import 'package:chat_app_1/controller/sign_in_controller.dart';
import 'package:chat_app_1/models/chat_model.dart';
import 'package:chat_app_1/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:intl/intl.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  ProfileScreenState createState() {
    return ProfileScreenState();
  }
}

class ProfileScreenState extends State<ProfileScreen> {
  SignInController signInController = Get.find<SignInController>();
  TextEditingController nameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  int gender = 0;
  String? imageAddress;

  @override
  void initState() {
    nameController.text = signInController.user!.displayName!;
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
            'Profile',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: false),
      body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection("userDetails")
              .doc(signInController.user!.uid)
              .get(),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasData) {
              nameController.text =
                  (snapshot.data as DocumentSnapshot).get("Name");
              dateOfBirthController.text =
                  (snapshot.data as DocumentSnapshot).get("DateOfBirth");
              gender =
                  int.parse((snapshot.data as DocumentSnapshot).get("Gender"));
              imageAddress = signInController.user!.photoURL;
            }
            return snapshot.hasData
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () async {
                              File? imageFile = await Utils.imageToFile();
                              if (imageFile != null) {
                                print(imageFile.absolute.path);
                                File file = File(imageFile.absolute.path);

                                try {
                                  firebase_storage.TaskSnapshot task =
                                      await firebase_storage
                                          .FirebaseStorage.instance
                                          .ref(
                                              'uploads/${signInController.user!.uid}.png')
                                          .putFile(file);

                                  String downloadURL = await firebase_storage
                                      .FirebaseStorage.instance
                                      .ref(
                                          'uploads/${signInController.user!.uid}.png')
                                      .getDownloadURL();
                                  print(downloadURL);
                                  await signInController.user!
                                      .updatePhotoURL(downloadURL);

                                  setState(() {
                                    imageAddress = downloadURL +
                                        "#" +
                                        DateFormat('yyyyddMMHHmm')
                                            .format(DateTime.now());
                                    print(imageAddress);
                                  });
                                } on FirebaseException catch (e) {
                                  // e.g, e.code == 'canceled'
                                }

                                // showProgress(context);
                                // var stringResponse = await editProfileController
                                //     .uploadProfilePicture(imageFile);
                                // Navigator.pop(context);
                                // if (stringResponse == "OK") {
                                //   Navigator.pop(context, true);
                                // }
                              }
                            },
                            child: CircleAvatar(
                              radius: 60,
                              backgroundColor: CustomTheme.primary,
                              backgroundImage: NetworkImage(
                                imageAddress == null
                                    ? 'https://static.projectmanagement.com/images/profile-photos/47440204_070121020946_p.jpg'
                                    : imageAddress!,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            TextField(
                              controller: nameController,
                              style: TextStyle(
                                fontSize: 21,
                              ),
                              cursorColor: CustomTheme.primary,
                              decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: CustomTheme.primary,
                                          width: 2))),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Date of Birth",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            TextField(
                              controller: dateOfBirthController,
                              style: TextStyle(
                                fontSize: 21,
                              ),
                              cursorColor: CustomTheme.primary,
                              decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: CustomTheme.primary,
                                          width: 2))),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Gender",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                        gender = 0;
                                      });
                                    },
                                    child: Text(
                                      "Male",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          color: gender == 0
                                              ? Colors.black
                                              : Colors.black54,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 21),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                        gender = 1;
                                      });
                                    },
                                    child: Text(
                                      "Female",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          color: gender == 1
                                              ? Colors.black
                                              : Colors.black54,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 21),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                        gender = 2;
                                      });
                                    },
                                    child: Text(
                                      "Non-binary",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          color: gender == 2
                                              ? Colors.black
                                              : Colors.black54,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 21),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.black,
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: InkWell(
                            onTap: () async {
                              await FirebaseFirestore.instance
                                  .collection("userDetails")
                                  .doc(signInController.user!.uid)
                                  .set({
                                "Name": nameController.text.trim(),
                                "DateOfBirth":
                                    dateOfBirthController.text.trim(),
                                "Gender": gender.toString()
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: CustomTheme.primary,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              // color: CustomTheme.primary,
                              width: MediaQuery.of(context).size.width * 0.83,
                              height: MediaQuery.of(context).size.height * 0.07,
                              child: Center(
                                child: Text(
                                  'SUBMIT',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: CustomTheme.light,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(
                    color: CustomTheme.primary,
                  ));
          }),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
