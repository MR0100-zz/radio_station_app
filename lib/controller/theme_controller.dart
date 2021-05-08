import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// THIS CLASS IS USED TO HANDLE APPLICATION THEME MODE...
class ThemeController extends GetxController {
  /// THIS ARE THE MAIN COLOR...
  Color primaryColor = Color(0xFF533C80);
  Color secondaryColor = Color(0xFFF11775);
  Color primaryBackgroundGradientColor = Color(0xFFE3E3E3);
  Color secondaryBackgroundGradientColor = Color(0xFFFFFFFF);
  Color primarySearchCardGradientColor = Color(0xFF5A4589);
  Color secondarySearchCardGradientColor = Color(0xFFFFFFFF);
  Color primaryButtonGradientColor = Color(0xFFF11775);
  Color secondaButtonGradientColor = Color(0xFFFB6580);
  Color socialMediaButtonColor = Color(0xFF1E1E2B);

  /// THIS VARIABLE IS USED TO SET THEME MODE - DARK OR LIGHT...
  bool isDarkMode = false;
  isDarkModeUpdate(bool value, {bool reInit = false}) {
    isDarkMode = value;
    if (isDarkMode) {
      /// SET DARK THEME MODE COLORS...
      primaryColor = Color(0xFF1D192C);
      secondaryColor = Color(0xFFF11775);
      primaryBackgroundGradientColor = Color(0xFF20202D);
      secondaryBackgroundGradientColor = Color(0xFF22223A);
      primarySearchCardGradientColor = Color(0xFF1A1726);
      secondarySearchCardGradientColor = Color(0xFF31294D);
      primaryButtonGradientColor = Color(0xFFF11775);
      secondaButtonGradientColor = Color(0xFFFB6580);
      socialMediaButtonColor = Color(0xFFFFFFFF);
    } else {
      /// SET LIGHT THEME MODE COLORS...
      primaryColor = Color(0xFF533C80);
      secondaryColor = Color(0xFFF11775);
      primaryBackgroundGradientColor = Color(0xFFE3E3E3);
      secondaryBackgroundGradientColor = Color(0xFFFFFFFF);
      primarySearchCardGradientColor = Color(0xFF5A4589);
      secondarySearchCardGradientColor = Color(0xFFFFFFFF);
      primaryButtonGradientColor = Color(0xFFF11775);
      secondaButtonGradientColor = Color(0xFFFB6580);
      socialMediaButtonColor = Color(0xFF1E1E2B);
    }
    if (!reInit) update();
  }
}
