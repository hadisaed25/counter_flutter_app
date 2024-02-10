import 'package:flutter/material.dart';

import '../Core/colors.dart';
import 'Tap/tap1.dart';
import 'Tap/tap2.dart';
import 'Tap/tap3.dart';
import 'Tap/tap4.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController
      _tabController; // declare a variable with type TabController
  String title = "سبحان الله"; //initial title wiht defualt value
  // Example list of tab titles
  List<String> tabTitlesList = [
    "سبحان الله",
    "الحمد الله",
    "لا الله الا الله",
    "الله أكبر"
  ];

  @override
  void initState() {
    super.initState();
    // initilaize tabcontroller with the lenght of the tabs and make an instance form it
    _tabController = TabController(length: tabTitlesList.length, vsync: this);
    // Add listner to the tab controller to handel the change of the tabs
    _tabController.addListener(_handleTabChange);
  }

  @override
  void dispose() {
    // remove the listener to avoid memory leak
    _tabController.removeListener(_handleTabChange);
    // dispose tabcontroller when widgit dispose
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabChange() {
    setState(() {
      title = tabTitlesList[
          _tabController.index]; //update the title based on the current tab
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 75,
            bottom: TabBar(
              // mouseCursor to define the sipe of the cursor in the app
              isScrollable: true,
              labelColor: brown2,
              indicatorColor: brown2,
              unselectedLabelColor: Colors.white70,
              controller: _tabController,
              tabs: tabTitlesList.map((title) => Text(title)).toList(),
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                overflow: TextOverflow.ellipsis,
                title,
                style: TextStyle(
                    fontSize: 40, fontWeight: FontWeight.bold, color: brown2),
              ),
            ),
            backgroundColor: brown,
            centerTitle: true,
          ),
          body: TabBarView(
            controller: _tabController,
            children: const [
              Tap1(title: "سبحان الله"),
              Tap2(title: "الحمد الله"),
              Tap3(title: "لا الله الا الله"),
              Tap4(title: "الله أكبر"),
            ],
          ),
        ),
      ),
    );
  }
}
