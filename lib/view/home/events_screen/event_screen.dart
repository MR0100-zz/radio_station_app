import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_station/controller/data/event_data_controller.dart';
import 'package:radio_station/controller/theme_controller.dart';
import 'package:radio_station/utilities/assets_utils.dart';
import 'package:radio_station/utilities/color_utils.dart';
import 'package:radio_station/utilities/style_utils.dart';
import 'package:radio_station/view/custom_widgets/custom_svg_view.dart';
import 'package:radio_station/view/home/common_widgets/event_banner.dart';
import 'package:radio_station/view/home/common_widgets/popular_broadcast_card.dart';
import 'package:radio_station/view/home/events_screen/popular_events_list.dart';
import 'package:radio_station/view/search/search_screen.dart';

/// ignore: must_be_immutable
class EventScreen extends StatelessWidget {
  ThemeController _themeController =
      Get.find(tag: ThemeController().toString());
  EventDataController _eventDataController =
      Get.find(tag: EventDataController().toString());
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return GetBuilder<ThemeController>(
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
          child: Column(
            children: [
              SizedBox(height: 70),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      'Events',
                      style: FontStyleData.h23(
                        fontColor: _themeController.isDarkMode
                            ? ColorData.color_0xffffffff
                            : ColorData.color_0xff543d81,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.to(SearchScreen());
                      },
                      child: Container(
                        color: ColorData.color_0x00000000,
                        padding: const EdgeInsets.only(
                            left: 10, top: 10, bottom: 10),
                        child: CustomSvgView(
                          height: 18,
                          width: 18,
                          imageUrl: AssetData.searchSvg,
                          svgColor: _themeController.isDarkMode
                              ? ColorData.color_0xff5c5e6f
                              : ColorData.color_0xfff32477,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        height: 230,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 10, bottom: 10, right: 20),
                              child: Row(
                                children: [
                                  Text(
                                    'Popular Events',
                                    style: FontStyleData.h12(
                                      fontColor: _themeController.isDarkMode
                                          ? ColorData.color_0xffffffff
                                          : ColorData.color_0xff5c5e6f,
                                      fontWeight: FWT.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(PopularEventsList());
                                    },
                                    child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 10, 0, 10),
                                      child: Text(
                                        'See all',
                                        style: FontStyleData.h10(
                                          fontColor: _themeController.isDarkMode
                                              ? ColorData.color_0xff5c5e6f
                                              : ColorData.color_0xfff32477,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: GetBuilder<EventDataController>(
                                  init: _eventDataController,
                                  builder: (_) {
                                    return ListView.builder(
                                      itemBuilder: (context, index) =>
                                          PopularBroadcastCard(
                                        image: _eventDataController
                                            .eventDataList[index].eventImage,
                                        title: _eventDataController
                                            .eventDataList[index].eventName,
                                        subTitle: _eventDataController
                                            .eventDataList[index]
                                            .eventDescription,
                                      ),
                                      itemCount: _eventDataController
                                          .eventDataList.length,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      physics: BouncingScrollPhysics(),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: EventBanner(
                          title: "DJ Party",
                          subTitle:
                              "This DJ party is organized for bacholor students enter in the first year of collage.",
                          image: "https://wallpaperaccess.com/full/3706676.jpg",
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        height: 30,
                        width: screenSize.width,
                        child: GetBuilder<EventDataController>(
                            init: _eventDataController,
                            builder: (_) {
                              return ListView.builder(
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      _eventDataController
                                          .selectedEventCategoryIndexUpdate(
                                              index);
                                    },
                                    child: Container(
                                      color: ColorData.color_0x00000000,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      child: Text(
                                        EventDataController
                                            .eventCategoryList[index],
                                        style: FontStyleData.h12(
                                            fontColor: _eventDataController
                                                        .selectedEventCategoryIndex ==
                                                    index
                                                ? ColorData.color_0xfff32477
                                                : ColorData.color_0xff5c5e6f),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: EventDataController
                                    .eventCategoryList.length,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                              );
                            }),
                      ),
                      SizedBox(height: 20),
                      GetBuilder<EventDataController>(
                          init: _eventDataController,
                          builder: (_) {
                            return Container(
                              height: 200,
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return PopularBroadcastCard(
                                    image: EventDataController
                                        .eventsList[_eventDataController
                                            .selectedEventCategoryIndex][index]
                                        .eventImage,
                                    title: EventDataController
                                        .eventsList[_eventDataController
                                            .selectedEventCategoryIndex][index]
                                        .eventName,
                                    subTitle: EventDataController
                                        .eventsList[_eventDataController
                                            .selectedEventCategoryIndex][index]
                                        .eventDescription,
                                  );
                                },
                                itemCount: EventDataController
                                    .eventsList[_eventDataController
                                        .selectedEventCategoryIndex]
                                    .length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                              ),
                            );
                          }),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: EventBanner(
                          title: "Holi Party",
                          subTitle:
                              "This Holi party is organized for all collage students from collage for the holi celibration.",
                          image:
                              "https://blog.radissonblu.com/wp-content/uploads/2019/08/Holi-celebration-in-India.jpg",
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
