import 'package:get/get.dart';

/// THIS CLASS CONTAINS DATA OF STARTUP PAGE...
class StartupScreenController extends GetxController {
  /// THIS VARIABLE IS USED TO MANAGE SELECTED STARTUP SCREEN...
  int currentScreen = 0;
  currentScreenUpdate(int value, {bool reInit = false}) {
    currentScreen = value;
    if (!reInit) update();
  }
}
