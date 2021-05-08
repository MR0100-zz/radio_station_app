import 'package:get/get.dart';
import 'package:radio_station/model/new_episode_data_model.dart';

/// THIS CLASS CONTAINS EPISODE DETAILS...
class NewEpisodeDataController extends GetxController {
  /// THIS LIST CONTAINS NEW EPISODE DATA FOR RADIO STATION SCREEN...
  final List<NewEpisodeDataModel> newEpisodeDataList = [
    NewEpisodeDataModel(
      newEpisodeTitle: "At Home With demi Lovato",
      newEpisodeDetails:
          "Demi Lovato has come a long way from her childhood home in Texas. With an impressive career spanning more than 18 years under her belt, it's no surprise that the American singer and actress has built up an impressive property portfolio along the road to stardom.",
      newEpisodeImage:
          "https://online.berklee.edu/takenote/wp-content/uploads/2019/03/killerHooks-1920x1200.png",
    ),
    NewEpisodeDataModel(
      newEpisodeTitle: "Kitty Party Album",
      newEpisodeDetails:
          "Kitty Party is a Punjabi album released on Nov 2019. This album is composed by Ulluminati.",
      newEpisodeImage:
          "https://images-na.ssl-images-amazon.com/images/I/51AQ7e5%2B-LL._SY445_SX342_QL70_ML2_.jpg",
    ),
    NewEpisodeDataModel(
      newEpisodeTitle: "Dayglow",
      newEpisodeDetails:
          "Sloan Struble, known professionally as Dayglow, is an American singer, songwriter, and producer from Aledo, Texas. ",
      newEpisodeImage:
          "https://riffmagazine.com/wp-content/uploads/2020/07/Dayglow-604-2020-Nick-Wong.jpg",
    ),
  ];
}
