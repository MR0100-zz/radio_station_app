import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_station/controller/data/music_data_controller.dart';
import 'package:radio_station/controller/theme_controller.dart';
import 'package:radio_station/model/music_data_model.dart';
import 'package:radio_station/utilities/assets_utils.dart';
import 'package:radio_station/utilities/color_utils.dart';
import 'package:radio_station/utilities/style_utils.dart';
import 'package:radio_station/view/custom_widgets/custom_svg_view.dart';
import 'package:radio_station/view/home/common_widgets/music_data_tile.dart';
import 'package:radio_station/view/search/search_screen.dart';

//ignore: must_be_immutable
class RecentSongsScreen extends StatelessWidget {
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
                      'Recently Played',
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
                SizedBox(height: 10),
                GetBuilder<MusicDataController>(
                    init: _musicDataController,
                    builder: (_) {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          MusicDataModel musicData = _musicDataController
                              .popularBroadcastListData[index];
                          return MusicDataTile(
                            musicData: musicData,
                            showMoreHeartData: ShowMoreHeartData.showNone,
                          );
                        },
                        itemCount: _musicDataController
                            .popularBroadcastListData.length,
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
