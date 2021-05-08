import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_station/controller/data/radio_station_data_controller.dart';
import 'package:radio_station/controller/theme_controller.dart';
import 'package:radio_station/utilities/color_utils.dart';
import 'package:radio_station/utilities/style_utils.dart';
import 'package:radio_station/view/home/common_widgets/popular_radio_card.dart';

/// ignore: must_be_immutable
class RadioStationList extends StatelessWidget {
  ThemeController _themeController =
      Get.find(tag: ThemeController().toString());
  RadioStationDataController _radioStationDataController =
      Get.find(tag: RadioStationDataController().toString());

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
              child: Column(
                children: [
                  SizedBox(height: 70),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
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
                          'Popular Radio Stations',
                          style: FontStyleData.h23(
                            fontColor: _themeController.isDarkMode
                                ? ColorData.color_0xffffffff
                                : ColorData.color_0xff543d81,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: GetBuilder<RadioStationDataController>(
                        init: _radioStationDataController,
                        builder: (_) {
                          return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.25,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 20,
                            ),
                            itemBuilder: (context, index) {
                              return PopularRadioCard(
                                radioData: _radioStationDataController
                                    .radioStationDataList[index],
                              );
                            },
                            physics: BouncingScrollPhysics(),
                            padding: EdgeInsets.only(bottom: 20),
                            itemCount: _radioStationDataController
                                .radioStationDataList.length,
                          );
                        }),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
