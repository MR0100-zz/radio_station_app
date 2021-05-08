import 'package:flutter/material.dart';

/// THIS MODEL IS FOR BOTTOM NAVIGATION BAR...
class BottomNavigationBarData {
  final String name;
  final String image;
  final int currentIndex;
  final Widget screen;

  BottomNavigationBarData(
      {this.screen, this.currentIndex, this.name, this.image});
}
