import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:radio_station/utilities/color_utils.dart';

class CustomSvgView extends StatelessWidget {
  final String imageUrl;
  final bool isFromAssets;
  final double height;
  final double width;
  final Color svgColor;

  const CustomSvgView(
      {Key key,
      this.imageUrl,
      this.isFromAssets,
      this.height,
      this.width,
      this.svgColor})
      : assert(imageUrl != "" && imageUrl != null);

  @override
  Widget build(BuildContext context) {
    return isFromAssets ?? true
        ? SvgPicture.asset(
            imageUrl,
            height: height ?? 15,
            width: width ?? 15,
            color: svgColor ?? ColorData.color_0xff7477a0,
          )
        : SvgPicture.network(
            imageUrl,
            height: height ?? 15,
            width: width ?? 15,
            color: svgColor ?? ColorData.color_0xff7477a0,
          );
  }
}
