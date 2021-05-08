import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_station/controller/data/music_data_controller.dart';
import 'package:radio_station/controller/theme_controller.dart';
import 'package:radio_station/model/music_data_model.dart';
import 'package:radio_station/utilities/assets_utils.dart';
import 'package:radio_station/utilities/color_utils.dart';
import 'package:radio_station/utilities/style_utils.dart';
import 'package:radio_station/view/custom_widgets/custom_image_view.dart';
import 'package:radio_station/view/custom_widgets/custom_svg_view.dart';
import 'package:radio_station/view/home/common_widgets/music_data_tile.dart';
import 'package:radio_station/view/home/profile_screen/common_widget/favorite_playlist_card.dart';
import 'package:radio_station/view/home/profile_screen/setting_screen/settings_screen.dart';
import 'package:radio_station/view/search/search_screen.dart';

/// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
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
          child: Column(
            children: [
              SizedBox(height: 60),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      'Profile',
                      style: FontStyleData.h23(
                        fontColor: _themeController.isDarkMode
                            ? ColorData.color_0xffffffff
                            : ColorData.color_0xff543d81,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.to(SettingsScreen());
                      },
                      child: Container(
                        color: ColorData.color_0x00000000,
                        padding: const EdgeInsets.only(
                            left: 10, top: 10, bottom: 10),
                        child: CustomSvgView(
                          height: 18,
                          width: 18,
                          imageUrl: AssetData.settingsSvg,
                          svgColor: _themeController.isDarkMode
                              ? ColorData.color_0xff5c5e6f
                              : ColorData.color_0xfff32477,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
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
              SizedBox(height: 30),
              Container(
                height: 125,
                width: 125,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorData.color_0x00000000,
                  border: Border.all(
                    width: 5,
                    color: ColorData.color_0xfff32477,
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 30,
                      color: ColorData.color_0xff000000,
                      offset: Offset(0, 10),
                      spreadRadius: -20,
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorData.color_0xfff32477,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CustomImageView(
                      imageUrl:
                          "https://i.pinimg.com/originals/73/16/f5/7316f550de9ca0045e3d8d98a5bb5e44.png",
                      isFromAssets: false,
                      height: 110,
                      width: 110,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Mitul Vaghasiya',
                style: FontStyleData.h14(
                    fontColor: _themeController.isDarkMode
                        ? ColorData.color_0xffffffff
                        : ColorData.color_0xfff32477),
              ),
              Text(
                'mr.vaghasiya197@gmail.com',
                style: FontStyleData.h14(fontColor: ColorData.color_0xff9a9db0),
              ),
              SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, top: 10, bottom: 10),
                        child: Row(
                          children: [
                            Text(
                              'Favorite Playlist',
                              style: FontStyleData.h14(
                                fontColor: _themeController.isDarkMode
                                    ? ColorData.color_0xffffffff
                                    : ColorData.color_0xff5c5e6f,
                                fontWeight: FWT.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 175,
                        child: GetBuilder<MusicDataController>(
                            init: _musicDataController,
                            builder: (_) {
                              return ListView.builder(
                                itemBuilder: (context, index) {
                                  MusicDataModel musicData =
                                      _musicDataController
                                          .popularBroadcastListData[index];
                                  return FavoritePlaylistCard(
                                    musicData: musicData,
                                    isFavorite: musicData.isFavorite,
                                  );
                                },
                                itemCount: _musicDataController
                                    .popularBroadcastListData.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.zero,
                                physics: BouncingScrollPhysics(),
                              );
                            }),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, top: 0, bottom: 10),
                        child: Row(
                          children: [
                            Text(
                              'Favorite Songs',
                              style: FontStyleData.h14(
                                fontColor: _themeController.isDarkMode
                                    ? ColorData.color_0xffffffff
                                    : ColorData.color_0xff5c5e6f,
                                fontWeight: FWT.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GetBuilder<MusicDataController>(
                            init: _musicDataController,
                            builder: (_) {
                              return ListView.builder(
                                itemBuilder: (context, index) {
                                  MusicDataModel musicData =
                                      _musicDataController
                                          .popularBroadcastListData[index];

                                  return MusicDataTile(
                                    musicData: musicData,
                                    showMoreHeartData:
                                        ShowMoreHeartData.showMoreHeart,
                                    isFavorite: musicData.isFavorite,
                                  );
                                },
                                itemCount: _musicDataController
                                    .popularBroadcastListData.length,
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                              );
                            }),
                      ),
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
