import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// THIS CLASS HANDLE MUSIC LIBRARY SCREEN...
class MusicLibraryScreenController extends GetxController {
  /// THIS PAGE CONTROLLER IS USED TO HANDLE CHANGING PAGE...
  PageController musicLibraryScreenPageViewController = PageController(
    initialPage: 0,
  );
  musicLibraryScreenPageViewControllerUpdate(PageController value,
      {bool reInit = false}) {
    musicLibraryScreenPageViewController = value;
    if (!reInit) update();
  }

  /// THIS VARIABLE IS USED TO MANAGE SELECTED PAGE...
  int musicLibrarySelectedScreen = 0;
  musicLibrarySelectedScreenUpdate(int value, {bool reInit = false}) {
    musicLibrarySelectedScreen = value;
    if (!reInit) update();
  }
}
