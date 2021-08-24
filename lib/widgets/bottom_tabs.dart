import 'package:flutter/material.dart';

class BottomTabs extends StatefulWidget {
  final int selectedTab;

  BottomTabs({required this.selectedTab});

  @override
  _BottomTabsState createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    _selectedTab = widget.selectedTab;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1.0,
            blurRadius: 30.0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomTabButton(
            imagePath: 'assets/images/tab_home.png',
            selected: _selectedTab == 0 ? true : false,
            onpressed: () {
              setState(() {
                _selectedTab = 0;
              });
            },
          ),
          BottomTabButton(
            imagePath: 'assets/images/tab_search.png',
            selected: _selectedTab == 1 ? true : false,
            onpressed: () {
              setState(() {
                _selectedTab = 1;
              });
            },
          ),
          BottomTabButton(
            imagePath: 'assets/images/tab_bookmark.png',
            selected: _selectedTab == 2 ? true : false,
            onpressed: () {
              setState(() {
                _selectedTab = 2;
              });
            },
          ),
          BottomTabButton(
            imagePath: 'assets/images/tab_logout.png',
            selected: _selectedTab == 3 ? true : false,
            onpressed: () {
              setState(() {
                _selectedTab = 3;
              });
            },
          ),
        ],
      ),
    );
  }
}

class BottomTabButton extends StatelessWidget {
  final String imagePath;
  final bool selected;
  final Function() onpressed;

  BottomTabButton(
      {required this.imagePath,
      required this.selected,
      required this.onpressed});

  @override
  Widget build(BuildContext context) {
    bool _selected = selected;

    return GestureDetector(
      onTap: onpressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
          color: _selected ? Theme.of(context).accentColor : Colors.transparent,
          width: 2.0,
        ))),
        child: Image(
          image: AssetImage(
            imagePath,
          ),
          width: 21.0,
          height: 21.0,
          color: _selected ? Theme.of(context).accentColor : Colors.black,
        ),
      ),
    );
  }
}
