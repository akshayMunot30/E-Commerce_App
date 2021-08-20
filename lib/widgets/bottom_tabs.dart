import 'package:flutter/material.dart';

class BottomTabs extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
            child: BottomTabButton(),
          );
  }
}

class BottomTabButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset("assets\images\tab_home.jpeg")
    );
  }
}