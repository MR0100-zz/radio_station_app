import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_station/controller/data/music_data_controller.dart';
import 'package:radio_station/view/home/common_widgets/music_data_tile.dart';

/// ignore: must_be_immutable
class PopularMusicScreen extends StatelessWidget {
  MusicDataController _musicDataController =
      Get.find(tag: MusicDataController().toString());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MusicDataController>(
        init: _musicDataController,
        builder: (_) {
          return ListView.builder(
            itemBuilder: (context, index) => MusicDataTile(
              musicData: _musicDataController.popularBroadcastListData[index],
              showMoreHeartData: ShowMoreHeartData.showMoreHeart,
              isFavorite: _musicDataController
                  .popularBroadcastListData[index].isFavorite,
            ),
            itemCount: _musicDataController.popularBroadcastListData.length,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
          );
        });
  }
}
