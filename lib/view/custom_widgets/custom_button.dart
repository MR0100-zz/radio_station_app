import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_station/controller/theme_controller.dart';
import 'package:radio_station/utilities/color_utils.dart';
import 'package:radio_station/utilities/style_utils.dart';

/// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final double height;
  final double width;
  ThemeController _themeController =
      Get.find(tag: ThemeController().toString());

  CustomButton({Key key, this.title, this.onPress, this.height, this.width})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return GetBuilder<ThemeController>(
        init: _themeController,
        builder: (_) {
          return GestureDetector(
            onTap: onPress ?? () {},
            child: Container(
              height: height ?? 50,
              width: width ?? screenSize.width / 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(
                  colors: [
                    _themeController.primaryButtonGradientColor,
                    _themeController.secondaButtonGradientColor,
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                title ?? '',
                style: FontStyleData.h16(fontColor: ColorData.color_0xffffffff),
              ),
            ),
          );
        });
  }
}
