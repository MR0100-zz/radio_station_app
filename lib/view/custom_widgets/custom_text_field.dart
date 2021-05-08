import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_station/controller/theme_controller.dart';
import 'package:radio_station/utilities/assets_utils.dart';
import 'package:radio_station/utilities/color_utils.dart';
import 'package:radio_station/utilities/style_utils.dart';
import 'custom_svg_view.dart';

/// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final String hintText;
  final String icon;
  final TextEditingController controller;
  final double height;
  final double width;

  ThemeController _themeController =
      Get.find(tag: ThemeController().toString());

  CustomTextField(
      {Key key,
      this.hintText,
      this.icon,
      this.controller,
      this.height,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return GetBuilder<ThemeController>(
        init: _themeController,
        builder: (_) {
          return Container(
            height: height ?? 50,
            width: width ?? screenSize.width - 80,
            decoration: BoxDecoration(
              color: _themeController.primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Container(
                  width: 50,
                  child: CustomSvgView(imageUrl: icon ?? AssetData.userSvg),
                ),
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hintText ?? "",
                      hintStyle: FontStyleData.h12(
                          fontColor: ColorData.color_0xffe3e3e3),
                    ),
                    style: FontStyleData.h12(
                        fontColor: ColorData.color_0xffe3e3e3),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
