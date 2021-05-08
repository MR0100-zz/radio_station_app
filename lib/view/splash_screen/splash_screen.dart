import 'dart:async';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_station/controller/theme_controller.dart';
import 'package:radio_station/utilities/assets_utils.dart';
import 'package:radio_station/utilities/color_utils.dart';
import 'package:radio_station/view/home/home.dart';
import '../authentication_view/login_screen.dart';
import '../custom_widgets/custom_image_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  /// [Timer]
  Timer _timer;
  void changeSplash() async {
    _timer = Timer.periodic(
      Duration(seconds: 3),
      (timer) {
        // bool isLogin = prefs.read("isRadioStationAppLogin");
        bool isLogin;
        if (isLogin ?? false) {
          _timer.cancel();
          Get.off(Home());

          /// [redirect to home_screen]
        } else {
          _timer.cancel();
          Get.off(LoginScreen());

          /// [redirect to login_screen / register_screen]
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    changeSplash();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  ThemeController _themeController =
      Get.find(tag: ThemeController().toString());

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: GetBuilder<ThemeController>(
        init: _themeController,
        builder: (_) {
          return Container(
            height: screenSize.height,
            width: screenSize.width,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                colors: [
                  _themeController.secondaryBackgroundGradientColor,
                  _themeController.primaryBackgroundGradientColor,
                ],
                radius: 1,
              ),
            ),
            alignment: Alignment.center,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment(0, -0.3),
                  child: AvatarGlow(
                    animate: true,
                    curve: Curves.easeInOut,
                    duration: Duration(seconds: 1),
                    endRadius: 130,
                    glowColor: ColorData.color_0xffa79dbf,
                    repeat: true,
                    showTwoGlows: true,
                    shape: BoxShape.circle,
                    child: Container(),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: CustomImageView(
                    imageUrl: AssetData.appLogo,
                    width: 160,
                    height: 280,
                    isFromAssets: true,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
