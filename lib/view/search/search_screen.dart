import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_station/controller/data/music_data_controller.dart';
import 'package:radio_station/controller/data/search_data_controller.dart';
import 'package:radio_station/controller/theme_controller.dart';
import 'package:radio_station/model/search_data_model.dart';
import 'package:radio_station/utilities/assets_utils.dart';
import 'package:radio_station/utilities/color_utils.dart';
import 'package:radio_station/utilities/style_utils.dart';
import 'package:radio_station/view/custom_widgets/custom_svg_view.dart';
import 'package:radio_station/view/home/common_widgets/music_data_tile.dart';
import 'package:radio_station/view/search/common_widget/search_card.dart';
import 'package:radio_station/view/search/search_all_screen.dart';

/// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  ThemeController _themeController =
      Get.find(tag: ThemeController().toString());

  MusicDataController _musicDataController =
      Get.find(tag: MusicDataController().toString());

  SearchDataController _searchDataController =
      Get.find(tag: SearchDataController().toString());

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
                        'Search',
                        style: FontStyleData.h23(
                          fontColor: _themeController.isDarkMode
                              ? ColorData.color_0xffffffff
                              : ColorData.color_0xff543d81,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  SizedBox(height: 40),
                  Container(
                    width: screenSize.width,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: _themeController.isDarkMode
                          ? ColorData.color_0xff1d192c
                          : ColorData.color_0xff533c80,
                      border: Border.all(
                        color: !_themeController.isDarkMode
                            ? ColorData.color_0xff1d192c
                            : ColorData.color_0xff533c80,
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
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(SearchScreen());
                          },
                          child: Container(
                            color: ColorData.color_0x00000000,
                            padding: const EdgeInsets.only(
                                left: 10, top: 10, bottom: 10),
                            child: CustomSvgView(
                              height: 15,
                              width: 15,
                              imageUrl: AssetData.searchSvg,
                              isFromAssets: true,
                              svgColor: _themeController.isDarkMode
                                  ? ColorData.color_0xff5c5e6f
                                  : ColorData.color_0xff000000,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Theme(
                            data: ThemeData(
                              textSelectionTheme: TextSelectionThemeData(
                                cursorColor: !_themeController.isDarkMode
                                    ? ColorData.color_0xff1d192c
                                    : ColorData.color_0xff533c80,
                                selectionHandleColor:
                                    !_themeController.isDarkMode
                                        ? ColorData.color_0xff1d192c
                                        : ColorData.color_0xff533c80,
                                selectionColor: !_themeController.isDarkMode
                                    ? ColorData.color_0xff1d192c
                                    : ColorData.color_0xff533c80,
                              ),
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search Here....",
                                hintStyle: FontStyleData.h12(
                                  fontColor: _themeController.isDarkMode
                                      ? ColorData.color_0xff5c5e6f
                                      : ColorData.color_0xff000000,
                                ),
                              ),
                              style: FontStyleData.h12(
                                fontColor: ColorData.color_0xffffffff,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Browse All",
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
                                  Get.to(SearchAllScreen());
                                },
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                                  child: Text(
                                    "See all",
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
                          SizedBox(height: 20),
                          GetBuilder<SearchDataController>(
                              init: _searchDataController,
                              builder: (_) {
                                return GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                  ),
                                  itemBuilder: (context, index) {
                                    SearchDataModel searchData =
                                        _searchDataController
                                            .searchDataList[index];
                                    return SearchCard(
                                      title: searchData.title,
                                      imageUrl: searchData.imageUrl,
                                    );
                                  },
                                  physics: NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  itemCount: 4,
                                  shrinkWrap: true,
                                );
                              }),
                          SizedBox(height: 30),
                          Row(
                            children: [
                              Text(
                                "Search Result",
                                style: FontStyleData.h12(
                                  fontColor: _themeController.isDarkMode
                                      ? ColorData.color_0xffffffff
                                      : ColorData.color_0xff5c5e6f,
                                  fontWeight: FWT.bold,
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                          GetBuilder<MusicDataController>(
                              init: _musicDataController,
                              builder: (_) {
                                return ListView.builder(
                                  itemBuilder: (context, index) =>
                                      MusicDataTile(
                                    musicData: _musicDataController
                                        .popularBroadcastListData[index],
                                    showMoreHeartData:
                                        ShowMoreHeartData.showMoreHeart,
                                    isFavorite: _musicDataController
                                        .popularBroadcastListData[index]
                                        .isFavorite,
                                  ),
                                  itemCount: _musicDataController
                                      .popularBroadcastListData.length,
                                  shrinkWrap: true,
                                  physics: ClampingScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                );
                              })
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
