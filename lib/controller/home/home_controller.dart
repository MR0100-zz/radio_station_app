import 'package:get/get.dart';

/// THIS CLASS HANDLE HOME PAGE...
class HomeController extends GetxController {
  /// THIS VARIABLE IS USED TO MANAGE SELECTED HOME SCREEN...
  int currentHomeIndex = 0;
  currentHomeIndexUpdate(int value, {bool reInit = false}) {
    currentHomeIndex = value;
    if (!reInit) update();
  }
}
