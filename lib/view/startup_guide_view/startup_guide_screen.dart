import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:radio_station/controller/startup_guid_view/startup_screen_controller.dart';
import 'package:radio_station/controller/theme_controller.dart';
import 'package:radio_station/utilities/assets_utils.dart';
import 'package:radio_station/utilities/color_utils.dart';
import 'package:radio_station/utilities/style_utils.dart';
import 'package:radio_station/view/custom_widgets/custom_button.dart';
import 'package:radio_station/view/custom_widgets/custom_image_view.dart';
import 'package:radio_station/view/home/home.dart';

class StartupGuideScreen extends StatefulWidget {
  @override
  _StartupGuideScreenState createState() => _StartupGuideScreenState();
}

class _StartupGuideScreenState extends State<StartupGuideScreen>
    with TickerProviderStateMixin {
  ThemeController _themeController =
      Get.find(tag: ThemeController().toString());

  StartupScreenController _startupController =
      Get.find(tag: StartupScreenController().toString());

  AnimationController _radioAnimationController1;
  AnimationController _radioAnimationController2;
  Animation _radioAnimation1;
  Animation _radioAnimation2;

  @override
  void initState() {
    _radioAnimationController1 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
      reverseDuration: Duration(milliseconds: 300),
    );
    _radioAnimationController2 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
      reverseDuration: Duration(milliseconds: 300),
    );

    _radioAnimation1 = Tween<double>(begin: 8, end: 3.3).animate(
        CurvedAnimation(
            parent: _radioAnimationController1, curve: Curves.bounceOut)
          ..reverseCurve = Curves.easeInOut);
    _radioAnimation2 = Tween<double>(begin: 8, end: 3.3).animate(
        CurvedAnimation(
            parent: _radioAnimationController2, curve: Curves.bounceOut)
          ..reverseCurve = Curves.easeInOut);

    _radioAnimationController1.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return GetBuilder<StartupScreenController>(
        init: _startupController,
        builder: (_) {
          return GetBuilder<ThemeController>(
              init: _themeController,
              builder: (_) {
                return Scaffold(
                  body: Stack(
                    children: [
                      Container(
                        height: screenSize.height,
                        width: screenSize.width,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: _themeController.isDarkMode
                                ? [
                                    ColorData.color_0xff20202d,
                                    ColorData.color_0xffffffff
                                  ]
                                : [
                                    ColorData.color_0xff533c80,
                                    ColorData.color_0xffffffff
                                  ],
                            begin: Alignment.topCenter,
                            end: Alignment(0, 1.5),
                          ),
                        ),
                      ),
                      Positioned(
                        top: screenSize.height / 2.2,
                        left: 0,
                        right: 0,
                        child: SvgPicture.asset(
                          AssetData.tutorialScreenBg,
                          width: screenSize.width,
                          height: screenSize.height,
                        ),
                      ),
                      AnimatedBuilder(
                          animation: _radioAnimation1,
                          builder: (context, snapshot) {
                            return AnimatedBuilder(
                                animation: _radioAnimation2,
                                builder: (context, snapshot) {
                                  return Positioned(
                                    top: screenSize.height /
                                        (_startupController.currentScreen == 0
                                            ? _radioAnimation1.value
                                            : _radioAnimation2.value),
                                    left: 0,
                                    right: 0,
                                    child: CustomImageView(
                                      imageUrl:
                                          _startupController.currentScreen == 0
                                              ? AssetData.tutorialScreenRadio
                                              : AssetData.tutorialScreenDrum,
                                      isFromAssets: true,
                                      height: 300,
                                      width: 280,
                                    ),
                                  );
                                });
                          }),
                      Align(
                        alignment: Alignment(0, -0.6),
                        child: Text(
                          _startupController.currentScreen == 0
                              ? 'Radio BroadCast'
                              : 'Music Library',
                          style: FontStyleData.h30(
                            fontColor: ColorData.color_0xffffffff,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _startupController.currentScreen == 1,
                        child: Align(
                          alignment: Alignment(-0.8, -0.8),
                          child: GestureDetector(
                            onTap: () {
                              _radioAnimationController2
                                  .reverse()
                                  .then((value) {
                                _startupController.currentScreenUpdate(0);
                                _radioAnimationController1.forward();
                              });
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorData.color_0xffffffff,
                              ),
                              alignment: Alignment(0.5, 0),
                              child: Icon(Icons.arrow_back_ios),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: screenSize.height / 1.35,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: CustomButton(
                            onPress: () {
                              if (_startupController.currentScreen == 0) {
                                _radioAnimationController1
                                    .reverse()
                                    .then((value) {
                                  _startupController.currentScreenUpdate(1);
                                  _radioAnimationController2.forward();
                                });
                              } else {
                                Get.offAll(Home());
                              }
                            },
                            title: _startupController.currentScreen == 0
                                ? "Next"
                                : "Get Started",
                            width: screenSize.width / 2,
                          ),
                        ),
                      ),
                      Positioned(
                        top: screenSize.height / 1.2,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 21,
                                width: 21,
                                decoration: BoxDecoration(
                                  color: _startupController.currentScreen == 0
                                      ? ColorData.color_0xffffffff
                                      : ColorData.color_0xffc5c5c5,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 15),
                              Container(
                                height: 21,
                                width: 21,
                                decoration: BoxDecoration(
                                  color: _startupController.currentScreen == 1
                                      ? ColorData.color_0xffffffff
                                      : ColorData.color_0xffc5c5c5,
                                  shape: BoxShape.circle,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              });
        });
  }
}
