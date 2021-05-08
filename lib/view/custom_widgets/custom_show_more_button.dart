import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:radio_station/controller/theme_controller.dart';
import 'package:radio_station/utilities/assets_utils.dart';
import 'package:radio_station/utilities/color_utils.dart';
import 'custom_svg_view.dart';

/// ignore: must_be_immutable
class CustomShowMoreButton extends StatelessWidget {
  final VoidCallback onPress;
  CustomShowMoreButton({Key key, this.onPress}) : super(key: key);

  ThemeController _themeController =
      Get.find(tag: ThemeController().toString());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      init: _themeController,
      builder: (_) {
        return Container(
          height: 15,
          width: 15,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _themeController.isDarkMode
                ? ColorData.color_0xff2b2a39
                : ColorData.color_0xfff32477,
          ),
          alignment: Alignment(-0.2, 0),
          child: CustomSvgView(
            height: 8,
            width: 8,
            imageUrl: AssetData.nextRightSvg,
            isFromAssets: true,
            svgColor: ColorData.color_0xffffffff,
          ),
        );
      },
    );
  }
}
