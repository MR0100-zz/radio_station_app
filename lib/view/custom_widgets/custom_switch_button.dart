import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:radio_station/controller/theme_controller.dart';
import 'package:radio_station/utilities/color_utils.dart';

typedef OnSwitchChange = void Function(bool);

/// ignore: must_be_immutable
class CustomSwitchButton extends StatefulWidget {
  final OnSwitchChange onChange;
  bool isSelected;
  CustomSwitchButton({Key key, this.onChange, this.isSelected = false})
      : super(key: key);

  @override
  _CustomSwitchButtonState createState() => _CustomSwitchButtonState();
}

class _CustomSwitchButtonState extends State<CustomSwitchButton>
    with TickerProviderStateMixin {
  ThemeController _themeController =
      Get.find(tag: ThemeController().toString());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      init: _themeController,
      builder: (_) {
        return GestureDetector(
          onTap: () {
            widget.isSelected = !widget.isSelected;
            widget.onChange(widget.isSelected);
            setState(() {});
          },
          child: Container(
            height: 25,
            width: 50,
            padding: EdgeInsets.symmetric(horizontal: 3),
            decoration: BoxDecoration(
              color: widget.isSelected
                  ? ColorData.color_0xfff32477
                  : ColorData.color_0xffebebeb,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Align(
              alignment: widget.isSelected
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: widget.isSelected
                      ? ColorData.color_0xffebebeb
                      : ColorData.color_0xff5c5e6f,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      offset: Offset(0, 3),
                      color: ColorData.color_0xff000000.withOpacity(0.5),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
