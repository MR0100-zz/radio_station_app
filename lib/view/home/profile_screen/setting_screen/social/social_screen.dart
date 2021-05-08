import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_station/controller/theme_controller.dart';
import 'package:radio_station/utilities/assets_utils.dart';
import 'package:radio_station/utilities/color_utils.dart';
import 'package:radio_station/utilities/style_utils.dart';
import 'package:radio_station/view/custom_widgets/custom_list_tile.dart';
import 'package:radio_station/view/custom_widgets/custom_social_button.dart';

/// ignore: must_be_immutable
class SocialScreen extends StatelessWidget {
  ThemeController _themeController =
      Get.find(tag: ThemeController().toString());
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return GetBuilder<ThemeController>(
      init: _themeController,
      builder: (_) {
        return Scaffold(
          body: Container(
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
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 70),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Icon(
                          Icons.keyboard_backspace,
                          color: ColorData.color_0xfff32477,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Social',
                      style: FontStyleData.h23(
                        fontColor: _themeController.isDarkMode
                            ? ColorData.color_0xffffffff
                            : ColorData.color_0xff543d81,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(height: 10),
                CustomListTile(
                  title: "Private Session",
                  showIconData: ShowIconData.showSwitch,
                  switchChangeCallBack: (bool value) {},
                  isSelected: true,
                ),
                CustomListTile(
                  title: "Listening Activity",
                  showIconData: ShowIconData.showSwitch,
                  switchChangeCallBack: (bool value) {},
                  isSelected: false,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    {
                      "title": "Connect to Google",
                      "svg": AssetData.googlePng,
                      "onTap": () {
                        print("google");
                      },
                    },
                    {
                      "title": "Connect to Facebook",
                      "svg": AssetData.facebookPng,
                      "onTap": () {
                        print("facebook");
                      },
                    },
                  ]
                      .map(
                        (e) => GestureDetector(
                          onTap: e['onTap'],
                          child: Container(
                            height: 140,
                            width: (screenSize.width - 60) / 2,
                            decoration: BoxDecoration(
                              color: _themeController.isDarkMode
                                  ? ColorData.color_0xff1d192c
                                  : ColorData.color_0xff533c80,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 30,
                                  color: ColorData.color_0xff000000,
                                  offset: Offset(0, 10),
                                  spreadRadius: -20,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomSocialButton(
                                  height: 34,
                                  width: 34,
                                  icon: e['svg'],
                                  onPress: e['onTap'],
                                ),
                                SizedBox(height: 5),
                                Text(
                                  e['title'] ?? '',
                                  style: FontStyleData.h12(
                                    fontColor: ColorData.color_0xffffffff,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
