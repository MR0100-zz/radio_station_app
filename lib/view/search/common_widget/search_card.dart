import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_station/controller/theme_controller.dart';
import 'package:radio_station/utilities/color_utils.dart';
import 'package:radio_station/utilities/style_utils.dart';
import 'package:radio_station/view/custom_widgets/custom_image_view.dart';

/// ignore: must_be_immutable
class SearchCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  ThemeController _themeController =
      Get.find(tag: ThemeController().toString());

  SearchCard({Key key, this.title, this.imageUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return GetBuilder<ThemeController>(
        init: _themeController,
        builder: (_) {
          return Container(
            height: 90,
            width: (screenSize.width - 60) / 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: LinearGradient(
                colors: [
                  _themeController.primarySearchCardGradientColor,
                  _themeController.secondarySearchCardGradientColor,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
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
            child: Row(
              children: [
                SizedBox(width: 20),
                Expanded(
                  child: Text(
                    title ?? '',
                    style: FontStyleData.h13(
                      fontColor: ColorData.color_0xffffffff,
                      fontWeight: FWT.bold,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationZ(pi / 3.5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: CustomImageView(
                      imageUrl: imageUrl ??
                          "https://i.pinimg.com/736x/4b/e3/2e/4be32e31b731d10f0ec869808e01279a.jpg",
                      isFromAssets: false,
                      height: 55,
                      width: 55,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
          );
        });
  }
}

class _themeController {}
