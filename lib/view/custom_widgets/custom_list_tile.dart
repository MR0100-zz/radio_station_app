import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_station/controller/theme_controller.dart';
import 'package:radio_station/utilities/color_utils.dart';
import 'package:radio_station/utilities/style_utils.dart';
import 'package:radio_station/view/custom_widgets/custom_show_more_button.dart';
import 'package:radio_station/view/custom_widgets/custom_svg_view.dart';
import 'package:radio_station/view/custom_widgets/custom_switch_button.dart';

/// THIS ENUM IS USED TO COMPARE SOME FIELDS AND MAKE LAYOUT ACCORDING TO CHOICE...
enum ShowIconData {
  showNext,
  showSwitch,
  showText,
  showNone,
  showIcon,
}

typedef SwitchChangeCallBack = void Function(bool);

/// ignore: must_be_immutable
class CustomListTile extends StatelessWidget {
  final ShowIconData showIconData;
  final String title;
  final SwitchChangeCallBack switchChangeCallBack;
  final VoidCallback onNextPress;
  final String trailing;
  final bool isSelected;
  final String svgUrl;
  final Color iconColor;
  CustomListTile({
    Key key,
    this.showIconData = ShowIconData.showNext,
    this.title,
    this.switchChangeCallBack,
    this.onNextPress,
    this.trailing,
    this.isSelected = false,
    this.svgUrl,
    this.iconColor,
  }) {
    if (this.showIconData == ShowIconData.showNext) {
      assert(onNextPress != null);
    }
    if (this.showIconData == ShowIconData.showSwitch) {
      assert(switchChangeCallBack != null);
    }
    if (this.showIconData == ShowIconData.showText) {
      assert(trailing != null);
    }

    if (this.showIconData == ShowIconData.showIcon) {
      assert(svgUrl != null && iconColor != null);
    }
  }

  ThemeController _themeController =
      Get.find(tag: ThemeController().toString());

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return GetBuilder<ThemeController>(
        init: _themeController,
        builder: (_) {
          return GestureDetector(
            onTap: showIconData == ShowIconData.showNext ||
                    showIconData == ShowIconData.showNone ||
                    showIconData == ShowIconData.showText
                ? onNextPress
                : () {},
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              alignment: Alignment.centerLeft,
              height: showIconData == ShowIconData.showIcon ? 65 : 50,
              padding: EdgeInsets.symmetric(horizontal: 15),
              width: screenSize.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: _themeController.isDarkMode
                    ? ColorData.color_0xff1d192c
                    : ColorData.color_0xff533c80,
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  showIconData == ShowIconData.showIcon
                      ? Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: iconColor,
                          ),
                          alignment: Alignment.center,
                          child: CustomSvgView(
                            height: 17,
                            width: 17,
                            imageUrl: svgUrl,
                            isFromAssets: true,
                            svgColor: ColorData.color_0xffffffff,
                          ),
                        )
                      : SizedBox(),
                  SizedBox(
                    width: showIconData == ShowIconData.showIcon ? 15 : 0,
                  ),
                  Text(
                    title ?? '',
                    style: FontStyleData.h13(
                        fontColor: ColorData.color_0xffffffff,
                        fontWeight: FWT.regular),
                  ),
                  Spacer(),
                  showIconData == ShowIconData.showNext
                      ? CustomShowMoreButton()
                      : SizedBox(),
                  showIconData == ShowIconData.showSwitch
                      ? CustomSwitchButton(
                          onChange: switchChangeCallBack,
                          isSelected: isSelected,
                        )
                      : SizedBox(),
                  showIconData == ShowIconData.showText
                      ? Text(
                          trailing ?? '',
                          style: FontStyleData.h11(
                              fontColor: ColorData.color_0xff7b7b8b),
                        )
                      : SizedBox(),
                ],
              ),
            ),
          );
        });
  }
}
