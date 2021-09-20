import 'package:chat_app_1/constants/theme.dart';
import 'package:chat_app_1/widgets/tab_heading.dart';
import 'package:flutter/material.dart';

import 'screens/message_screen.dart';

void main() {
  runApp(const TabBarDemo());
}

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
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
                // Padding(
                //   padding: EdgeInsets.only(bottom: 10),
                //   child: TabHeadingText(
                //     heading: 'message',
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.only(bottom: 10),
                //   child: TabHeadingText(
                //     heading: 'group',
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.only(bottom: 10),
                //   child: TabHeadingText(
                //     heading: 'calls',
                //   ),
                // ),
              ],
            ),
            title: const Text(
              'All Chat',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            centerTitle: false,
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: Icon(
                  Icons.search,
                  size: 35,
                ),
              )
            ],
          ),
          body: const TabBarView(
            children: [
              MessageScreen(),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}
