import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_station/controller/data/connected_device_data_controller.dart';
import 'package:radio_station/controller/theme_controller.dart';
import 'package:radio_station/model/connected_device_data_model.dart';
import 'package:radio_station/utilities/color_utils.dart';
import 'package:radio_station/utilities/style_utils.dart';
import 'package:radio_station/view/custom_widgets/custom_list_tile.dart';

/// ignore: must_be_immutable
class ConnectDeviceScreen extends StatelessWidget {
  ThemeController _themeController =
      Get.find(tag: ThemeController().toString());
  ConnectedDeviceDataController _connectedDeviceDataController =
      Get.find(tag: ConnectedDeviceDataController().toString());
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return GetBuilder<ThemeController>(
      init: _themeController,
      builder: (_) {
        return Scaffold(
          body: Container(
            height: screenSize.height,
            width: screenSize.width,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                colors: [
                  _themeController.secondaryBackgroundGradientColor,
                  _themeController.primaryBackgroundGradientColor,
                ],
                radius: 1,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 70),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Icon(
                          Icons.keyboard_backspace,
                          color: ColorData.color_0xfff32477,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Connected To Device',
                      style: FontStyleData.h23(
                        fontColor: _themeController.isDarkMode
                            ? ColorData.color_0xffffffff
                            : ColorData.color_0xff543d81,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(height: 10),
                GetBuilder<ConnectedDeviceDataController>(
                    init: _connectedDeviceDataController,
                    builder: (_) {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          ConnectedDeviceDataModel deviceData =
                              _connectedDeviceDataController
                                  .connectedDeviceDataList[index];
                          return CustomListTile(
                            title: deviceData.title,
                            iconColor: deviceData.iconBgColor,
                            svgUrl: deviceData.svgUrl,
                            showIconData: ShowIconData.showIcon,
                          );
                        },
                        itemCount: _connectedDeviceDataController
                            .connectedDeviceDataList.length,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                      );
                    }),
              ],
            ),
          ),
        );
      },
    );
  }
}
