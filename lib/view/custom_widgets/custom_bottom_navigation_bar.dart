import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_station/controller/theme_controller.dart';
import 'package:radio_station/model/bottom_navigation_bar_data_model.dart';
import 'package:radio_station/utilities/color_utils.dart';
import 'package:radio_station/utilities/style_utils.dart';
import 'custom_svg_view.dart';

typedef OnBottomBarTabChange = void Function(int);

/// ignore:must_be_immutable
class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final OnBottomBarTabChange onChange;
  final List<BottomNavigationBarData> bottomNavigationBarDataList;
  ThemeController _themeController =
      Get.find(tag: ThemeController().toString());
  CustomBottomNavigationBar({
    Key key,
    @required this.screenSize,
    this.currentIndex = 0,
    this.onChange,
    this.bottomNavigationBarDataList,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      init: _themeController,
      builder: (_) {
        return Container(
          width: screenSize.width,
          height: 70,
          decoration: BoxDecoration(
            color: _themeController.isDarkMode
                ? ColorData.color_0xff181a26
                : ColorData.color_0xffffffff,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                spreadRadius: -15,
                offset: Offset(0, 5),
                color: ColorData.color_0xff0f0e15,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: bottomNavigationBarDataList
                .map((BottomNavigationBarData e) => GestureDetector(
                      onTap: () {
                        onChange(e.currentIndex);
                      },
                      child: Container(
                        color: ColorData.color_0x00000000,
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 5,
                              width: 25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: currentIndex == e.currentIndex
                                      ? ColorData.color_0xfff22276
                                      : ColorData.color_0x00000000),
                            ),
                            CustomSvgView(
                              imageUrl: e.image,
                              isFromAssets: true,
                              height: 22,
                              width: 22,
                              svgColor: currentIndex == e.currentIndex
                                  ? ColorData.color_0xfff22276
                                  : (_themeController.isDarkMode
                                      ? ColorData.color_0xff5c5e6f
                                      : ColorData.color_0xff533c80),
                            ),
                            Text(
                              e.name,
                              style: FontStyleData.h9(
                                fontColor: currentIndex == e.currentIndex
                                    ? ColorData.color_0xfff22276
                                    : (_themeController.isDarkMode
                                        ? ColorData.color_0xff5c5e6f
                                        : ColorData.color_0xff533c80),
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ))
                .toList(),
          ),
        );
      },
    );
  }
}
