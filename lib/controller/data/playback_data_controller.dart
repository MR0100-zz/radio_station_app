import 'package:get/get.dart';
import 'package:radio_station/model/playback_data_model.dart';

/// THIS CLASS CONTAINS PLAYBACK DATA FOR PLAYBACK SCREEN...
class PlayBackDataController extends GetxController {
  /// THIS LIST CONTAINS PLAYBACK DATA FOR PLAYBACK SCREEN...
  final List<PlayBackDataModel> playBackDataList = [
    PlayBackDataModel(title: "Dark Mode", isSwitchOn: false),
    PlayBackDataModel(title: "Gapless", isSwitchOn: true),
    PlayBackDataModel(title: "Automix", isSwitchOn: false),
    PlayBackDataModel(title: "Show Unplayable Songs", isSwitchOn: false),
    PlayBackDataModel(title: "Normalize Volume", isSwitchOn: true),
    PlayBackDataModel(title: "Autoplay", isSwitchOn: true),
    PlayBackDataModel(title: "Canvas", isSwitchOn: false),
  ];

  /// THIS FUNCTION IS USED TO UPDATE THE UI MODE(DARK / LIGHT)...
  changeUiModeUpdate(bool value, {bool reInit = false}) {
    this.playBackDataList[0] =
        PlayBackDataModel(title: "Dark Mode", isSwitchOn: value);
    if (!reInit) update();
  }
}
