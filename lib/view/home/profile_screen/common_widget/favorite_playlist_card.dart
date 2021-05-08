import 'package:flutter/material.dart';
import 'package:radio_station/model/music_data_model.dart';
import 'package:radio_station/utilities/color_utils.dart';
import 'package:radio_station/view/custom_widgets/custom_image_view.dart';

/// ignore: must_be_immutable
class FavoritePlaylistCard extends StatelessWidget {
  final MusicDataModel musicData;
  final VoidCallback onFavoriteIconPress;
  final bool isFavorite;
  FavoritePlaylistCard({
    Key key,
    this.musicData,
    this.onFavoriteIconPress,
    this.isFavorite = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 5, bottom: 30, right: 10),
      height: 150,
      width: 150,
      alignment: Alignment.topCenter,
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
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CustomImageView(
              imageUrl: musicData.musicPortfolioImage,
              fit: BoxFit.cover,
              isFromAssets: false,
              height: 150,
              width: 150,
            ),
          ),
          isFavorite
              ? GestureDetector(
                  onTap: onFavoriteIconPress,
                  child: Align(
                    alignment: Alignment(0.8, -0.8),
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorData.color_0xffffffff,
                      ),
                      alignment: Alignment(0, 0.5),
                      child: Icon(
                        Icons.favorite_rounded,
                        size: 15,
                        color: ColorData.color_0xfffb6580,
                      ),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
