import 'package:flutter/material.dart';
import 'package:radio_station/model/interview_data_model.dart';
import 'package:radio_station/utilities/color_utils.dart';
import 'package:radio_station/utilities/style_utils.dart';
import 'package:radio_station/view/custom_widgets/custom_image_view.dart';

class InterviewDataTile extends StatelessWidget {
  final InterviewDataModel interviewData;

  const InterviewDataTile({Key key, this.interviewData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: 200,
              height: 130,
              color: ColorData.color_0xff0f0e15,
              child: Row(
                children: interviewData.images
                    .map(
                      (e) => CustomImageView(
                        imageUrl: e,
                        isFromAssets: false,
                        fit: BoxFit.cover,
                        width: 200 / 3,
                        height: 160,
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            interviewData.title ?? '',
            style: FontStyleData.h9(
              fontColor: ColorData.color_0xff5c5e6f,
            ),
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
