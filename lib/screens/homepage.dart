import 'package:e_commerce_app/widgets/bottom_tabs.dart';
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
    _tabsPageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _tabsPageController.dispose();
    super.dispose();
  }

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedTab = index;
  //   });
  // }

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

      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.home,
      //         color: Colors.black,
      //       ),
      //       label: "Home",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.search,
      //         color: Colors.black,
      //       ),
      //       label: "Search",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.bookmark,
      //         color: Colors.black,
      //       ),
      //       label: "Saved",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.logout,
      //         color: Colors.black,
      //       ),
      //       label: "Logout",
      //     ),
      //   ],
      //   currentIndex: _selectedTab,
      //   selectedItemColor: Colors.black,
      //   showSelectedLabels: true,
      //   onTap: _onItemTapped,
      // ),
    );
  }
}
