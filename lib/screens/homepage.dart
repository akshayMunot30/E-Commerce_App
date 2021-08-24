import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/widgets/bottom_tabs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _tabsPageController = PageController(initialPage: 0);

  int _selectedTab = 0;

  @override
  void initState() {
    _tabsPageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _tabsPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: PageView(
              controller: _tabsPageController,
              onPageChanged: (num) {
                setState(() {
                  _selectedTab = num;
                });
              },
              children: [
                Container(
                  child: PageView(
                    children: [
                      Container(
                        child: Center(
                          child: Text("Homepage"),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Text("Search Page"),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Text("Saved Page"),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          BottomTabs(
            selectedTab: _selectedTab,
          ),
        ],
      ),
    );
  }
}
