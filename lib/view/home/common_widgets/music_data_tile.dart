import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_station/controller/theme_controller.dart';
import 'package:radio_station/model/music_data_model.dart';
import 'package:radio_station/utilities/assets_utils.dart';
import 'package:radio_station/utilities/color_utils.dart';
import 'package:radio_station/utilities/style_utils.dart';
import 'package:radio_station/view/custom_widgets/custom_image_view.dart';
import 'package:radio_station/view/custom_widgets/custom_svg_view.dart';

enum ShowMoreHeartData {
  showMore,
  showHeart,
  showMoreHeart,
  showNone,
}

/// ignore: must_be_immutable
class MusicDataTile extends StatelessWidget {
  final MusicDataModel musicData;
  final ShowMoreHeartData showMoreHeartData;
  final bool isFavorite;
  final VoidCallback onPress;
  MusicDataTile({
    Key key,
    this.musicData,
    this.showMoreHeartData = ShowMoreHeartData.showMore,
    this.isFavorite = false,
    this.onPress,
  }) : super(key: key);

  ThemeController _themeController =
      Get.find(tag: ThemeController().toString());

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return GetBuilder<ThemeController>(
        init: _themeController,
        builder: (_) {
          return GestureDetector(
            onTap: onPress ?? () {},
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
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
              alignment: Alignment.centerLeft,
              height: showMoreHeartData == ShowMoreHeartData.showMoreHeart
                  ? 80
                  : 70,
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: screenSize.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: ColorData.color_0xff1d192c,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          color: ColorData.color_0xff000000,
                          offset: Offset(0, 10),
                          spreadRadius: -10,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: CustomImageView(
                        imageUrl: musicData.musicPortfolioImage,
                        fit: BoxFit.cover,
                        isFromAssets: false,
                        height: 45,
                        width: 45,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          musicData.musicName,
                          style: FontStyleData.h10(
                              fontColor: ColorData.color_0xffffffff,
                              fontWeight: FWT.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 5),
                        Text(
                          musicData.musicSubTitle,
                          style: FontStyleData.h10(
                              fontColor: ColorData.color_0xff9a9db0,
                              fontWeight: FWT.medium),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 5),
                  showMoreHeartData == ShowMoreHeartData.showMore ||
                          showMoreHeartData == ShowMoreHeartData.showMoreHeart
                      ? CustomSvgView(
                          height: 4,
                          width: 17,
                          imageUrl: AssetData.moreSvg,
                          isFromAssets: true,
                          svgColor: _themeController.isDarkMode
                              ? ColorData.color_0xff7b7b8b
                              : ColorData.color_0xffffffff,
                        )
                      : SizedBox(),
                  SizedBox(
                      width: showMoreHeartData == ShowMoreHeartData.showHeart ||
                              showMoreHeartData ==
                                  ShowMoreHeartData.showMoreHeart
                          ? 15
                          : 0),
                  showMoreHeartData == ShowMoreHeartData.showHeart ||
                          showMoreHeartData == ShowMoreHeartData.showMoreHeart
                      ? CustomSvgView(
                          height: 11,
                          width: 11,
                          imageUrl: AssetData.heartSvg,
                          isFromAssets: true,
                          svgColor: isFavorite
                              ? ColorData.color_0xfff32477
                              : ColorData.color_0xff7b7b8b,
                        )
                      : SizedBox(),
                  SizedBox(width: 10),
                ],
              ),
            ),
          );
        });
  }
}
