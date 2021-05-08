import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_station/controller/home/music_wave_controller.dart';
import 'package:radio_station/controller/theme_controller.dart';
import 'package:radio_station/utilities/color_utils.dart';
import 'package:radio_station/utilities/style_utils.dart';
import 'package:radio_station/view/custom_widgets/custom_image_view.dart';

/// ignore: must_be_immutable
class MusicPlayScreen extends StatelessWidget {
  final String musicName;
  final String musicSubtitle;
  final String imageUrl;

  MusicPlayScreen({Key key, this.musicName, this.musicSubtitle, this.imageUrl})
      : super(key: key);

  ThemeController _themeController =
      Get.find(tag: ThemeController().toString());

  MusicWaveController _musicWaveController =
      Get.find(tag: MusicWaveController().toString());

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
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: CustomImageView(
                    imageUrl: imageUrl,
                    fit: BoxFit.fill,
                    height: screenSize.height / 2.5,
                    width: screenSize.width,
                    isFromAssets: false,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: screenSize.height - 200,
                    width: screenSize.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          _themeController.primaryBackgroundGradientColor,
                          _themeController.primaryBackgroundGradientColor,
                          _themeController.primaryBackgroundGradientColor,
                          _themeController.primaryBackgroundGradientColor,
                          _themeController.primaryBackgroundGradientColor,
                          _themeController.primaryBackgroundGradientColor,
                          _themeController.primaryBackgroundGradientColor
                              .withOpacity(0),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, -0.3),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: ColorData.color_0xff000000,
                          blurRadius: 30,
                          offset: Offset(0, 10),
                          spreadRadius: -20,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CustomImageView(
                        imageUrl: imageUrl,
                        fit: BoxFit.fill,
                        height: screenSize.width / 2,
                        width: screenSize.width / 2,
                        isFromAssets: false,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, 0.1),
                  child: Text(
                    musicName,
                    style: FontStyleData.h23(
                      fontColor: _themeController.isDarkMode
                          ? ColorData.color_0xffffffff
                          : ColorData.color_0xff5c5e6f,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, 0.15),
                  child: Text(
                    musicSubtitle,
                    style: FontStyleData.h11(
                      fontColor: _themeController.isDarkMode
                          ? ColorData.color_0xffffffff.withOpacity(0.7)
                          : ColorData.color_0xff5c5e6f,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(-0.85, -0.85),
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      color: ColorData.color_0x00000000,
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.keyboard_backspace_rounded,
                        size: 30,
                        color: ColorData.color_0xffee5a96,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, 0.4),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('41:00',
                            style: FontStyleData.h9(
                                fontColor: ColorData.color_0xff7b7b8b)),
                        SizedBox(width: 10),
                        Expanded(
                          child: GetBuilder<MusicWaveController>(
                              init: _musicWaveController,
                              builder: (_) {
                                _musicWaveController.startSong();
                                _musicWaveController.startSong();
                                return MusicWaves(
                                    _musicWaveController.selectedWaveIndex);
                              }),
                        ),
                        SizedBox(width: 10),
                        Text('1:00',
                            style: FontStyleData.h9(
                                fontColor: ColorData.color_0xff7b7b8b)),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, 0.7),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _musicWaveController.seekBackword();
                          },
                          child: Icon(
                            Icons.skip_previous_rounded,
                            color: _themeController.isDarkMode
                                ? ColorData.color_0xffffffff
                                : ColorData.color_0xff5c478b,
                            size: 40,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _musicWaveController.playPauseState();
                          },
                          child: GetBuilder<MusicWaveController>(
                              init: _musicWaveController,
                              builder: (_) {
                                return Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorData.color_0xfff32477,
                                  ),
                                  alignment: Alignment.center,
                                  child: Icon(
                                    _musicWaveController.isPlayingState
                                        ? Icons.pause
                                        : Icons.play_arrow_rounded,
                                    color: ColorData.color_0xffffffff,
                                    size: 40,
                                  ),
                                );
                              }),
                        ),
                        GestureDetector(
                          onTap: () {
                            _musicWaveController.seekForward();
                          },
                          child: Icon(
                            Icons.skip_next_rounded,
                            color: _themeController.isDarkMode
                                ? ColorData.color_0xffffffff
                                : ColorData.color_0xff5c478b,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class MusicWaves extends StatelessWidget {
  final int selectedWaveIndex;

  Random r = Random();
  ThemeController _themeController =
      Get.find(tag: ThemeController().toString());

  MusicWaves(
    this.selectedWaveIndex, {
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
        init: _themeController,
        builder: (_) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(60, (index) {
              double randomWaveHeight = (r.nextInt(50) + 10).toDouble();
              return Container(
                height: randomWaveHeight,
                width: 2,
                decoration: BoxDecoration(
                  color: index < selectedWaveIndex
                      ? ColorData.color_0xfff32477
                      : _themeController.isDarkMode
                          ? ColorData.color_0xffffffff
                          : ColorData.color_0xff5c5e6f,
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            }),
          );
        });
  }
}
