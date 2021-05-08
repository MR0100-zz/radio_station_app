import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_station/controller/data/interview_data_controller.dart';
import 'package:radio_station/controller/data/new_episode_data_controller.dart';
import 'package:radio_station/controller/data/radio_station_data_controller.dart';
import 'package:radio_station/controller/theme_controller.dart';
import 'package:radio_station/model/interview_data_model.dart';
import 'package:radio_station/model/new_episode_data_model.dart';
import 'package:radio_station/utilities/assets_utils.dart';
import 'package:radio_station/utilities/color_utils.dart';
import 'package:radio_station/utilities/style_utils.dart';
import 'package:radio_station/view/custom_widgets/custom_svg_view.dart';
import 'package:radio_station/view/home/common_widgets/interview_data_tile.dart';
import 'package:radio_station/view/home/common_widgets/new_episode_card.dart';
import 'package:radio_station/view/home/common_widgets/popular_radio_card.dart';
import 'package:radio_station/view/home/radio_station_screen/radio_station_list.dart';
import 'package:radio_station/view/search/search_screen.dart';

/// ignore: must_be_immutable
class RadioStationScreen extends StatelessWidget {
  ThemeController _themeController =
      Get.find(tag: ThemeController().toString());
  InterviewDataController _interviewDataController =
      Get.find(tag: InterviewDataController().toString());
  NewEpisodeDataController _newEpisodeDataController =
      Get.find(tag: NewEpisodeDataController().toString());
  RadioStationDataController _radioStationDataController =
      Get.find(tag: RadioStationDataController().toString());
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
                      'Radio Station',
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
                        height: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 10, bottom: 10, right: 20),
                              child: Row(
                                children: [
                                  Text(
                                    'Popular Radio',
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
                                      Get.to(RadioStationList());
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
                              child: GetBuilder<RadioStationDataController>(
                                  init: _radioStationDataController,
                                  builder: (_) {
                                    return ListView.builder(
                                      itemBuilder: (context, index) =>
                                          PopularRadioCard(
                                        radioData: _radioStationDataController
                                            .radioStationDataList[index],
                                      ),
                                      itemCount: (_radioStationDataController
                                              .radioStationDataList.length ~/
                                          2),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      physics: BouncingScrollPhysics(),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Row(
                          children: [
                            Text(
                              'New Episodes',
                              style: FontStyleData.h12(
                                fontColor: _themeController.isDarkMode
                                    ? ColorData.color_0xffffffff
                                    : ColorData.color_0xff5c5e6f,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GetBuilder<NewEpisodeDataController>(
                            init: _newEpisodeDataController,
                            builder: (_) {
                              return ListView.builder(
                                itemBuilder: (context, index) {
                                  NewEpisodeDataModel newEpisode =
                                      _newEpisodeDataController
                                          .newEpisodeDataList[index];
                                  return NewEpisodeCard(
                                    newEpisode: newEpisode,
                                    showDivider: index !=
                                        (_newEpisodeDataController
                                                .newEpisodeDataList.length -
                                            1),
                                  );
                                },
                                itemCount: _newEpisodeDataController
                                    .newEpisodeDataList.length,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                              );
                            }),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Row(
                          children: [
                            Text(
                              'Artist Interview',
                              style: FontStyleData.h12(
                                fontColor: _themeController.isDarkMode
                                    ? ColorData.color_0xffffffff
                                    : ColorData.color_0xff5c5e6f,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 140,
                        width: screenSize.width,
                        child: GetBuilder<InterviewDataController>(
                            init: _interviewDataController,
                            builder: (_) {
                              return ListView.builder(
                                itemBuilder: (context, index) {
                                  InterviewDataModel interviewData =
                                      _interviewDataController
                                          .interviewDataList[index];
                                  return InterviewDataTile(
                                    interviewData: interviewData,
                                  );
                                },
                                itemCount: _interviewDataController
                                    .interviewDataList.length,
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                              );
                            }),
                      ),
                      SizedBox(height: 40)
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
