import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_station/controller/data/music_genre_data_controller.dart';
import 'package:radio_station/model/music_genre_model.dart';
import 'package:radio_station/view/custom_widgets/custom_list_tile.dart';

/// ignore: must_be_immutable
class MusicGenreScreen extends StatelessWidget {
  MusicGenreDataController _musicGenreDataController =
      Get.find(tag: MusicGenreDataController().toString());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MusicGenreDataController>(
        init: _musicGenreDataController,
        builder: (_) {
          return ListView.builder(
            itemBuilder: (context, index) {
              MusicGenreModel musicGenreData =
                  _musicGenreDataController.musicGenreList[index];
              return CustomListTile(
                title: musicGenreData.title,
                showIconData: ShowIconData.showNext,
                onNextPress: () {},
              );
            },
            itemCount: _musicGenreDataController.musicGenreList.length,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
          );
        });
  }
}
