import 'package:flutter/material.dart';
import 'package:radio_station/model/new_episode_data_model.dart';
import 'package:radio_station/utilities/color_utils.dart';
import 'package:radio_station/utilities/style_utils.dart';
import 'package:radio_station/view/custom_widgets/custom_image_view.dart';

class NewEpisodeCard extends StatelessWidget {
  final NewEpisodeDataModel newEpisode;
  final bool showDivider;

  const NewEpisodeCard({Key key, this.newEpisode, this.showDivider})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(
            children: [
              Container(
                height: 100,
                width: 100,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: CustomImageView(
                  imageUrl: newEpisode.newEpisodeImage,
                  fit: BoxFit.cover,
                  isFromAssets: false,
                  height: 100,
                  width: 100,
                ),
              ),
              SizedBox(width: 50),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      newEpisode.newEpisodeTitle ?? '',
                      style: FontStyleData.h10(
                        fontColor: ColorData.color_0xffffffff,
                        fontWeight: FWT.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      newEpisode.newEpisodeDetails ?? '',
                      style: FontStyleData.h9(
                        fontColor: ColorData.color_0xff5c5e6f,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (showDivider) ...{
          Divider(
            height: 1,
            indent: 100,
            color: ColorData.color_0xff5c5e6f,
          ),
        }
      ],
    );
  }
}
