import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_station/controller/theme_controller.dart';
import 'package:radio_station/utilities/assets_utils.dart';
import 'custom_image_view.dart';

/// ignore: must_be_immutable
class CustomSocialButton extends StatelessWidget {
  final String icon;
  final VoidCallback onPress;
  final double height;
  final double width;

  ThemeController _themeController =
      Get.find(tag: ThemeController().toString());

  CustomSocialButton(
      {Key key, this.icon, this.onPress, this.height, this.width})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
        init: _themeController,
        builder: (_) {
          return GestureDetector(
            onTap: onPress ?? () {},
            child: Container(
              height: height == null ? 50 : (height * 2),
              width: width == null ? 50 : (width * 2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _themeController.socialMediaButtonColor,
              ),
              alignment: Alignment.center,
              child: CustomImageView(
                imageUrl: icon ?? AssetData.googlePng,
                height: height ?? 18,
                width: width ?? 18,
              ),
            ),
          );
        });
  }
}
