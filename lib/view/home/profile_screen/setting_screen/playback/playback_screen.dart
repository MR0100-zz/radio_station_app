import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_station/controller/data/playback_data_controller.dart';
import 'package:radio_station/controller/theme_controller.dart';
import 'package:radio_station/model/playback_data_model.dart';
import 'package:radio_station/utilities/color_utils.dart';
import 'package:radio_station/utilities/style_utils.dart';
import 'package:radio_station/utilities/var_utils.dart';
import 'package:radio_station/view/custom_widgets/custom_list_tile.dart';

/// ignore: must_be_immutable
class PlaybackScreen extends StatefulWidget {
  @override
  _PlaybackScreenState createState() => _PlaybackScreenState();
}

class _PlaybackScreenState extends State<PlaybackScreen>
    with TickerProviderStateMixin {
  ThemeController _themeController =
      Get.find(tag: ThemeController().toString());

  PlayBackDataController _playBackDataController =
      Get.find(tag: PlayBackDataController().toString());

  AnimationController _themeAnimationController;
  Animation _themeAnimation;

  @override
  void initState() {
    _themeAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
      reverseDuration: Duration(milliseconds: 600),
    );
    _themeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _themeAnimationController,
        curve: Curves.easeIn,
        reverseCurve: Curves.easeOut,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return GetBuilder<ThemeController>(
      init: _themeController,
      builder: (_) {
        return Scaffold(
          body: Stack(
            children: [
              Container(
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
                          'Playback',
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
                    GetBuilder<PlayBackDataController>(
                        init: _playBackDataController,
                        builder: (_) {
                          return ListView.builder(
                            itemBuilder: (context, index) {
                              PlayBackDataModel playbackData =
                                  _playBackDataController
                                      .playBackDataList[index];
                              return CustomListTile(
                                title: playbackData.title,
                                showIconData: ShowIconData.showSwitch,
                                switchChangeCallBack: (bool value) {
                                  if (index == 0) {
                                    _themeAnimationController
                                        .forward()
                                        .then((_) {
                                      _playBackDataController
                                          .changeUiModeUpdate(value);
                                      prefs.write("isDarkModeOn", value);
                                      _themeController.isDarkModeUpdate(value);
                                      _themeAnimationController.reverse();
                                    });
                                  }
                                  print(index);
                                  print(value);
                                },
                                isSelected: playbackData.isSwitchOn,
                              );
                            },
                            itemCount:
                                _playBackDataController.playBackDataList.length,
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                          );
                        }),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: AnimatedBuilder(
                  animation: _themeAnimation,
                  builder: (context, _themeAnimationSnapshot) {
                    return Opacity(
                      opacity: _themeAnimation.value,
                      child: Transform.scale(
                        alignment: Alignment.center,
                        scale: _themeAnimation.value * 3,
                        child: Container(
                          width: screenSize.width,
                          height: screenSize.height,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorData.color_0xff1d192c,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
