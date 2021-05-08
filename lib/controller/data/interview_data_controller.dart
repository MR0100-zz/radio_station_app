import 'package:get/get.dart';
import 'package:radio_station/model/interview_data_model.dart';

/// THIS CLASS CONTAINS DATA OF INTERVIEW...
class InterviewDataController extends GetxController {
  /// THIS LIST CONTAINS ALL DATA OF INTERVIEW...
  final List<InterviewDataModel> interviewDataList = [
    InterviewDataModel(
      title: "Interview Of Some Musicials",
      images: [
        "https://www.kveller.com/wp-content/uploads/2016/05/shabbat-songs-1200x800.jpg",
        "https://27mi124bz6zg1hqy6n192jkb-wpengine.netdna-ssl.com/wp-content/uploads/2019/10/Our-Top-10-Songs-About-School-768x569.png",
        "https://api.time.com/wp-content/uploads/2019/09/karaoke-mic.jpg"
      ],
    ),
    InterviewDataModel(
      title: "Some Interview",
      images: [
        "https://www.kveller.com/wp-content/uploads/2016/05/shabbat-songs-1200x800.jpg",
        "https://27mi124bz6zg1hqy6n192jkb-wpengine.netdna-ssl.com/wp-content/uploads/2019/10/Our-Top-10-Songs-About-School-768x569.png",
        "https://api.time.com/wp-content/uploads/2019/09/karaoke-mic.jpg"
      ],
    ),
    InterviewDataModel(
      title: "Sofia Interview ",
      images: [
        "https://www.kveller.com/wp-content/uploads/2016/05/shabbat-songs-1200x800.jpg",
        "https://27mi124bz6zg1hqy6n192jkb-wpengine.netdna-ssl.com/wp-content/uploads/2019/10/Our-Top-10-Songs-About-School-768x569.png",
        "https://api.time.com/wp-content/uploads/2019/09/karaoke-mic.jpg"
      ],
    ),
  ];
}
