import 'package:chat_app_1/constants/theme.dart';
import 'package:chat_app_1/controller/members_controller.dart';
import 'package:chat_app_1/controller/message_controller.dart';
import 'package:chat_app_1/controller/sign_in_controller.dart';
import 'package:chat_app_1/screens/call_screen.dart';
import 'package:chat_app_1/screens/group_screen.dart';
import 'package:chat_app_1/screens/sign_in_screen.dart';
import 'package:chat_app_1/screens/sign_selection_screen.dart';
import 'package:chat_app_1/widgets/tab_heading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'screens/message_screen.dart';
// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Initializing Controllers
  Get.put(SignInController());
  Get.put(MessageController());
  Get.put(MembersController());

  runApp(TabBarDemo());
}

// ignore: must_be_immutable
class TabBarDemo extends StatelessWidget {
  TabBarDemo({Key? key}) : super(key: key);

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: CustomTheme.primary));
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: CustomTheme.primary,
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(secondary: CustomTheme.primary)),
        home: SignSelectionScreen());
  }
}

class HomeScreen extends StatelessWidget {
  SignInController signInController = Get.find<SignInController>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 70,
          backgroundColor: CustomTheme.primary,

          // foregroundColor: ,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                child: TabHeadingText(
                  heading: 'Message',
                ),
              ),
              Tab(
                child: TabHeadingText(
                  heading: 'Group',
                ),
              ),
              Tab(
                child: TabHeadingText(
                  heading: 'Calls',
                ),
              ),
            ],
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              "Hello " + signInController.user!.displayName!.split(" ")[0],
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          // leading: [],
          centerTitle: false,
          actions: [
            const Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.search,
                size: 28,
              ),
            ),
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert),
              onSelected: (String value) {
                switch (value) {
                  case 'Profile':
                    break;
                  case 'Settings':
                    break;
                  case 'Logout':
                    FirebaseAuth.instance.signOut();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignSelectionScreen()),
                        ModalRoute.withName("/SignIn"));
                    break;
                }
              },
              itemBuilder: (BuildContext context) {
                return {'Profile', 'Settings', 'Logout'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: const TabBarView(
          children: [
            MessageScreen(),
            GroupScreen(),
            CallScreen(),
          ],
        ),
      ),
    );
  }
}
