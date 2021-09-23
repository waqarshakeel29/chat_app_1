import 'package:chat_app_1/constants/theme.dart';
import 'package:chat_app_1/screens/call_screen.dart';
import 'package:chat_app_1/screens/group_screen.dart';
import 'package:chat_app_1/screens/sign_in_screen.dart';
import 'package:chat_app_1/widgets/tab_heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/message_screen.dart';

void main() {
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
      home: SignInScreen());
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
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
            title: const Text(
              'All Chat',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
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
                onSelected: (String value) {
                  switch (value) {
                    case 'Profile':
                      break;
                    case 'Settings':
                      break;
                    case 'Logout':
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

