import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_station/controller/data/music_data_controller.dart';
import 'package:radio_station/controller/theme_controller.dart';
import 'package:radio_station/utilities/assets_utils.dart';
import 'package:radio_station/utilities/color_utils.dart';
import 'package:radio_station/utilities/style_utils.dart';
import 'package:radio_station/view/custom_widgets/custom_image_view.dart';
import 'package:radio_station/view/custom_widgets/custom_svg_view.dart';
import 'package:radio_station/view/home/common_widgets/music_data_tile.dart';
import 'package:radio_station/view/home/common_widgets/popular_broadcast_card.dart';
import 'package:radio_station/view/home/music_play_screen.dart';
import 'package:radio_station/view/search/search_screen.dart';

/// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  ThemeController _themeController =
      Get.find(tag: ThemeController().toString());

  MusicDataController _musicDataController =
      Get.find(tag: MusicDataController().toString());

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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: screenSize.height / 1.6,
                      width: screenSize.width,
                      child: Stack(
                        children: [
                          CustomImageView(
                            imageUrl: AssetData.homeScreenBanner,
                            height: screenSize.height / 2.1,
                            width: screenSize.width,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            height: screenSize.height / 2.1,
                            width: screenSize.width,
                            color: ColorData.color_0xff000000.withOpacity(0.4),
                          ),
                          Align(
                            alignment: Alignment(-0.7, -0.4),
                            child: Text(
                              'Tabitha Nauser',
                              style: FontStyleData.h11(
                                  fontColor: ColorData.color_0xffffffff),
                            ),
                          ),
                          Align(
                            alignment: Alignment(-0.7, -0.3),
                            child: Text(
                              'Bulletproof',
                              style: FontStyleData.h31(
                                  fontColor: ColorData.color_0xfff32477),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(SearchScreen());
                            },
                            child: Align(
                              alignment: Alignment(0.8, -0.7),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 0, 10),
                                child: CustomSvgView(
                                  imageUrl: AssetData.searchSvg,
                                  isFromAssets: true,
                                  svgColor: ColorData.color_0xffffffff,
                                  height: 22,
                                  width: 22,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(-0.7, 0.8),
                            child: Container(
                              height: 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 10, bottom: 10),
                                    child: Text(
                                      'Popular Broadcast',
                                      style: FontStyleData.h14(
                                        fontColor: ColorData.color_0xffffffff,
                                        fontWeight: FWT.bold,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: GetBuilder<MusicDataController>(
                                        init: _musicDataController,
                                        builder: (_musicDataController) {
                                          return ListView.builder(
                                            itemBuilder: (context, index) =>
                                                PopularBroadcastCard(
                                              title: _musicDataController
                                                  .popularBroadcastListData[
                                                      index]
                                                  .albumName,
                                              subTitle: _musicDataController
                                                  .popularBroadcastListData[
                                                      index]
                                                  .albumMaker,
                                              image: _musicDataController
                                                  .popularBroadcastListData[
                                                      index]
                                                  .musicPortfolioImage,
                                              onPress: () {
                                                Get.to(MusicPlayScreen(
                                                  imageUrl: _musicDataController
                                                      .popularBroadcastListData[
                                                          index]
                                                      .musicPortfolioImage,
                                                  musicName: _musicDataController
                                                      .popularBroadcastListData[
                                                          index]
                                                      .albumName,
                                                  musicSubtitle:
                                                      _musicDataController
                                                          .popularBroadcastListData[
                                                              index]
                                                          .albumMaker,
                                                ));
                                              },
                                            ),
                                            itemCount: _musicDataController
                                                .popularBroadcastListData
                                                .length,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            physics: BouncingScrollPhysics(),
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 0, bottom: 10),
                      child: Text(
                        'Simmilar Broadcast',
                        style: FontStyleData.h14(
                          fontColor: _themeController.isDarkMode
                              ? ColorData.color_0xffffffff
                              : ColorData.color_0xff5c5e6f,
                          fontWeight: FWT.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: GetBuilder<MusicDataController>(
                          init: _musicDataController,
                          builder: (_) {
                            return ListView.builder(
                              itemBuilder: (context, index) => MusicDataTile(
                                musicData: _musicDataController
                                    .popularBroadcastListData[index],
                              ),
                              itemCount: _musicDataController
                                  .popularBroadcastListData.length,
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                            );
                          }),
                    ),
                  ],
                ),
              ));
        });
  }
}
