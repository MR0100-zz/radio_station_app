import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_station/controller/data/event_data_controller.dart';
import 'package:radio_station/controller/theme_controller.dart';
import 'package:radio_station/model/event_data_model.dart';
import 'package:radio_station/utilities/color_utils.dart';
import 'package:radio_station/utilities/style_utils.dart';
import 'package:radio_station/view/home/common_widgets/popular_broadcast_card.dart';

/// ignore: must_be_immutable
class PopularEventsList extends StatelessWidget {
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
                          'Popular Events',
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
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.95,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 30,
                      ),
                      itemBuilder: (context, index) {
                        EventDataModel eventData =
                            EventDataController.eventAllList[index];
                        return PopularBroadcastCard(
                          title: eventData.eventName,
                          subTitle: eventData.eventDescription,
                          image: eventData.eventImage,
                          height: 150,
                          width: 150,
                        );
                      },
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.only(bottom: 20),
                      itemCount: EventDataController.eventAllList.length,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
