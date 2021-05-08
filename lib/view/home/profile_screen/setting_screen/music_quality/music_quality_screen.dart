import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_station/controller/theme_controller.dart';
import 'package:radio_station/utilities/color_utils.dart';
import 'package:radio_station/utilities/style_utils.dart';
import 'package:radio_station/view/custom_widgets/custom_list_tile.dart';

/// ignore: must_be_immutable
class MusicQualityScreen extends StatelessWidget {
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
                      'Music Quality',
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
                  title: "Streaming",
                  showIconData: ShowIconData.showText,
                  trailing: "Automatic",
                  onNextPress: () {},
                ),
                CustomListTile(
                  title: "Download using cellular",
                  showIconData: ShowIconData.showSwitch,
                  switchChangeCallBack: (bool value) {},
                  isSelected: false,
                ),
                CustomListTile(
                  title: "Equalizer",
                  showIconData: ShowIconData.showNone,
                  onNextPress: () {},
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
