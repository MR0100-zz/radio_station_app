import 'package:get/get.dart';
import 'package:radio_station/model/settings_data_model.dart';
import 'package:radio_station/view/home/profile_screen/setting_screen/about_us/about_us_screen.dart';
import 'package:radio_station/view/home/profile_screen/setting_screen/connect_device/connect_device_screen.dart';
import 'package:radio_station/view/home/profile_screen/setting_screen/music_quality/music_quality_screen.dart';
import 'package:radio_station/view/home/profile_screen/setting_screen/playback/playback_screen.dart';
import 'package:radio_station/view/home/profile_screen/setting_screen/playback/recent_songs_screen.dart';
import 'package:radio_station/view/home/profile_screen/setting_screen/social/social_screen.dart';

/// THIS CLASS CONTAINS SETTINGS SCREEN DATA...
class SettingsDataContoller extends GetxController {
  /// THIS LIST CONTAINS DATA TO LIST IN SETTINGS SCREEN...
  final List<SettingsDataModel> settingsDataList = [
    SettingsDataModel(
      title: "Playback",
      screen: PlaybackScreen(),
    ),
    SettingsDataModel(
      title: "Connecte to device",
      screen: ConnectDeviceScreen(),
    ),
    SettingsDataModel(
      title: "Social",
      screen: SocialScreen(),
    ),
    SettingsDataModel(
      title: "Music Quality",
      screen: MusicQualityScreen(),
    ),
    SettingsDataModel(
      title: "About Us",
      screen: AboutUsScreen(),
    ),
    SettingsDataModel(
      title: "Recent Songs",
      screen: RecentSongsScreen(),
    ),
  ];
}
