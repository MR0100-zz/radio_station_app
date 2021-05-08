import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_station/controller/data/settings_data_controller.dart';
import 'package:radio_station/controller/theme_controller.dart';
import 'package:radio_station/model/settings_data_model.dart';
import 'package:radio_station/utilities/color_utils.dart';
import 'package:radio_station/utilities/style_utils.dart';
import 'package:radio_station/view/custom_widgets/custom_list_tile.dart';

//ignore: must_be_immutable
class SettingsScreen extends StatelessWidget {
  ThemeController _themeController =
      Get.find(tag: ThemeController().toString());
  SettingsDataContoller _settingsDataContoller =
      Get.find(tag: SettingsDataContoller().toString());
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
                      'More',
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
                GetBuilder<SettingsDataContoller>(
                    init: _settingsDataContoller,
                    builder: (_) {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          SettingsDataModel settingsData =
                              _settingsDataContoller.settingsDataList[index];
                          return CustomListTile(
                            title: settingsData.title,
                            showIconData: ShowIconData.showNext,
                            onNextPress: () {
                              Get.to(settingsData.screen);
                            },
                          );
                        },
                        itemCount:
                            _settingsDataContoller.settingsDataList.length,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                      );
                    }),
              ],
            ),
          ),
        );
      },
    );
  }
}
