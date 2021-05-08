import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_station/controller/data/search_data_controller.dart';
import 'package:radio_station/controller/theme_controller.dart';
import 'package:radio_station/model/search_data_model.dart';
import 'package:radio_station/utilities/color_utils.dart';
import 'package:radio_station/utilities/style_utils.dart';
import 'package:radio_station/view/search/common_widget/search_card.dart';

/// ignore: must_be_immutable
class SearchAllScreen extends StatelessWidget {
  ThemeController _themeController =
      Get.find(tag: ThemeController().toString());
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
                        'Browse All',
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
                  Expanded(
                    child: GetBuilder<SearchDataController>(
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
                                  _searchDataController.searchDataList[index];
                              return SearchCard(
                                title: searchData.title,
                                imageUrl: searchData.imageUrl,
                              );
                            },
                            physics: BouncingScrollPhysics(),
                            padding: EdgeInsets.only(bottom: 20),
                            itemCount:
                                _searchDataController.searchDataList.length,
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
