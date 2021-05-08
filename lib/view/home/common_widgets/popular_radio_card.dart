import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_station/controller/theme_controller.dart';
import 'package:radio_station/model/radio_station_data_model.dart';
import 'package:radio_station/utilities/color_utils.dart';
import 'package:radio_station/utilities/style_utils.dart';
import 'package:radio_station/view/custom_widgets/custom_image_view.dart';

/// ignore: must_be_immutable
class PopularRadioCard extends StatelessWidget {
  final RadioStationDataModel radioData;
  final VoidCallback onPress;
  PopularRadioCard({
    Key key,
    this.radioData,
    this.onPress,
  }) : super(key: key);

  ThemeController _themeController =
      Get.find(tag: ThemeController().toString());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress ?? () {},
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 10),
        height: 200,
        width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 5),
              height: 120,
              width: 200,
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
                  imageUrl: radioData.radioStationImage,
                  fit: BoxFit.cover,
                  isFromAssets: false,
                  height: 120,
                  width: 200,
                ),
              ),
            ),
            Spacer(),
            Text(
              radioData.radioStationName,
              style: FontStyleData.h12(
                fontColor: _themeController.isDarkMode
                    ? ColorData.color_0xffffffff
                    : ColorData.color_0xfff22276,
                fontWeight: FWT.bold,
              ),
            ),
            Text(
              radioData.radioStationDetails,
              style: FontStyleData.h10(
                fontColor: ColorData.color_0xff5c5e6f,
                fontWeight: FWT.medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
