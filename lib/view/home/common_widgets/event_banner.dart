import 'package:flutter/material.dart';
import 'package:radio_station/utilities/color_utils.dart';
import 'package:radio_station/utilities/style_utils.dart';
import 'package:radio_station/view/custom_widgets/custom_image_view.dart';

class EventBanner extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;

  const EventBanner({Key key, this.title, this.subTitle, this.image})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: 140,
      width: screenSize.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: ColorData.color_0xff1d192c,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            spreadRadius: -15,
            offset: Offset(0, 5),
            color: ColorData.color_0xff0f0e15,
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CustomImageView(
              imageUrl: image ?? "",
              isFromAssets: false,
              fit: BoxFit.fill,
              height: 140,
              width: screenSize.width,
            ),
          ),
          Align(
            alignment: Alignment(-0.8, 0.1),
            child: Text(
              title ?? '',
              style: FontStyleData.h23(
                fontColor: ColorData.color_0xffffffff,
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.3, 0.5),
            child: Container(
              width: screenSize.width - 130,
              child: Text(
                subTitle ?? '',
                style: FontStyleData.h11(
                  fontColor: ColorData.color_0xff9a9db0,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
