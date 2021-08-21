import 'package:flutter/material.dart';

class BottomTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            selected: true,
          ),
          BottomTabButton(
            imagePath: 'assets/images/tab_search.png',
            selected: false,
          ),
          BottomTabButton(
            imagePath: 'assets/images/tab_bookmark.png',
            selected: false,
          ),
          BottomTabButton(
            imagePath: 'assets/images/tab_logout.png',
            selected: false,
          ),
        ],
      ),
    );
  }
}

class BottomTabButton extends StatelessWidget {
  final String imagePath;
  final bool selected;
  BottomTabButton({required this.imagePath, required this.selected});

  @override
  Widget build(BuildContext context) {
    bool _selected = selected;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
        color: Theme.of(context).accentColor,
        width: 2.0,
      ))),
      child: Image(
        image: AssetImage(
          imagePath,
        ),
        width: 21.0,
        height: 21.0,
      ),
    );
  }
}
