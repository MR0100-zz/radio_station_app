import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_station/controller/home/music_library_screen/music_library_screen_controller.dart';
import 'package:radio_station/controller/theme_controller.dart';
import 'package:radio_station/utilities/assets_utils.dart';
import 'package:radio_station/utilities/color_utils.dart';
import 'package:radio_station/utilities/style_utils.dart';
import 'package:radio_station/view/custom_widgets/custom_button.dart';
import 'package:radio_station/view/custom_widgets/custom_image_view.dart';
import 'package:radio_station/view/custom_widgets/custom_svg_view.dart';
import 'package:radio_station/view/home/music_library_screen/music_genre_screen.dart';
import 'package:radio_station/view/home/music_library_screen/popular_music_screen.dart';
import 'package:radio_station/view/search/search_screen.dart';

/// ignore: must_be_immutable
class MusicLibraryScreen extends StatelessWidget {
  ThemeController _themeController =
      Get.find(tag: ThemeController().toString());

  MusicLibraryScreenController _musicLibraryScreenController =
      Get.find(tag: MusicLibraryScreenController().toString());

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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Music Library',
                        style: FontStyleData.h23(
                          fontColor: _themeController.isDarkMode
                              ? ColorData.color_0xffffffff
                              : ColorData.color_0xff543d81,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(SearchScreen());
                      },
                      child: Container(
                        color: ColorData.color_0x00000000,
                        padding: const EdgeInsets.only(
                            left: 10, top: 10, bottom: 10),
                        child: CustomSvgView(
                          imageUrl: AssetData.searchSvg,
                          height: 16,
                          width: 16,
                          isFromAssets: true,
                          svgColor: _themeController.isDarkMode
                              ? ColorData.color_0xff5c5e6f
                              : ColorData.color_0xfff32477,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 15),
                GetBuilder<MusicLibraryScreenController>(
                    init: _musicLibraryScreenController,
                    builder: (_) {
                      return Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _musicLibraryScreenController
                                  .musicLibraryScreenPageViewController
                                  .animateToPage(0,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeInOut);
                              _musicLibraryScreenController
                                  .musicLibrarySelectedScreenUpdate(0);
                            },
                            child: Container(
                              color: ColorData.color_0x00000000,
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                'Popular Music',
                                style: FontStyleData.h12(
                                  fontColor: _musicLibraryScreenController
                                              .musicLibrarySelectedScreen ==
                                          0
                                      ? ColorData.color_0xfff32477
                                      : ColorData.color_0xff5c5e6f,
                                  fontWeight: FWT.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          GestureDetector(
                            onTap: () {
                              _musicLibraryScreenController
                                  .musicLibraryScreenPageViewController
                                  .animateToPage(1,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeInOut);
                              _musicLibraryScreenController
                                  .musicLibrarySelectedScreenUpdate(1);
                            },
                            child: Container(
                              color: ColorData.color_0x00000000,
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                'Music Genre',
                                style: FontStyleData.h12(
                                  fontColor: _musicLibraryScreenController
                                              .musicLibrarySelectedScreen ==
                                          1
                                      ? ColorData.color_0xfff32477
                                      : ColorData.color_0xff5c5e6f,
                                  fontWeight: FWT.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                SizedBox(height: 15),
                Container(
                  height: 90,
                  width: screenSize.width,
                  decoration: BoxDecoration(
                    color: ColorData.color_0xff1d192c,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        color: ColorData.color_0xff000000,
                        offset: Offset(0, 10),
                        spreadRadius: -10,
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: CustomImageView(
                          imageUrl:
                              "https://media.istockphoto.com/photos/microphone-in-a-professional-recording-or-radio-studio-equipment-in-picture-id1130063226?k=6&m=1130063226&s=170667a&w=0&h=zgmSub0g6DyLR1t7Y8wBOSrRsRcN8pjBYnKT4UJzGHk=",
                          isFromAssets: false,
                          fit: BoxFit.cover,
                          height: 90,
                          width: screenSize.width,
                        ),
                      ),
                      Container(
                        height: 90,
                        width: screenSize.width,
                        decoration: BoxDecoration(
                          color: ColorData.color_0xff000000.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Enjoy your day with RadioApp',
                                    style: FontStyleData.h8(
                                        fontColor: ColorData.color_0xffffffff),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Tune your radio now',
                                    style: FontStyleData.h16(
                                        fontColor: ColorData.color_0xffffffff),
                                  ),
                                ],
                              ),
                            ),
                            CustomButton(
                              title: "Tune now",
                              height: 25,
                              width: screenSize.width / 4,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: GetBuilder<MusicLibraryScreenController>(
                      init: _musicLibraryScreenController,
                      builder: (_) {
                        return PageView(
                          controller: _musicLibraryScreenController
                              .musicLibraryScreenPageViewController,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            PopularMusicScreen(),
                            MusicGenreScreen(),
                          ],
                        );
                      }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
