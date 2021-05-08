import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:radio_station/controller/data/connected_device_data_controller.dart';
import 'package:radio_station/controller/data/event_data_controller.dart';
import 'package:radio_station/controller/data/interview_data_controller.dart';
import 'package:radio_station/controller/data/music_data_controller.dart';
import 'package:radio_station/controller/data/music_genre_data_controller.dart';
import 'package:radio_station/controller/data/new_episode_data_controller.dart';
import 'package:radio_station/controller/data/playback_data_controller.dart';
import 'package:radio_station/controller/data/radio_station_data_controller.dart';
import 'package:radio_station/controller/data/search_data_controller.dart';
import 'package:radio_station/controller/data/settings_data_controller.dart';
import 'package:radio_station/controller/home/home_controller.dart';
import 'package:radio_station/controller/home/music_library_screen/music_library_screen_controller.dart';
import 'package:radio_station/controller/home/music_wave_controller.dart';
import 'package:radio_station/controller/startup_guid_view/startup_screen_controller.dart';
import 'package:radio_station/controller/theme_controller.dart';
import 'package:radio_station/utilities/color_utils.dart';
import 'package:radio_station/view/splash_screen/splash_screen.dart';
import 'utilities/var_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  prefs = GetStorage();
  return runApp(RadioStationApp());
}

class RadioStationApp extends StatefulWidget {
  @override
  _RadioStationAppState createState() => _RadioStationAppState();
}

class _RadioStationAppState extends State<RadioStationApp> {
  ThemeController _themeController =
      Get.put(ThemeController(), tag: ThemeController().toString());
  StartupScreenController _startupController = Get.put(
      StartupScreenController(),
      tag: StartupScreenController().toString());
  HomeController _homeController =
      Get.put(HomeController(), tag: HomeController().toString());
  MusicLibraryScreenController _musicLibraryScreenController = Get.put(
      MusicLibraryScreenController(),
      tag: MusicLibraryScreenController().toString());
  EventDataController _eventDataController =
      Get.put(EventDataController(), tag: EventDataController().toString());
  MusicWaveController _musicWaveController =
      Get.put(MusicWaveController(), tag: MusicWaveController().toString());
  ConnectedDeviceDataController _connectedDeviceDataController = Get.put(
      ConnectedDeviceDataController(),
      tag: ConnectedDeviceDataController().toString());
  InterviewDataController _interviewDataController = Get.put(
      InterviewDataController(),
      tag: InterviewDataController().toString());
  MusicDataController _musicDataController =
      Get.put(MusicDataController(), tag: MusicDataController().toString());
  MusicGenreDataController _musicGenreDataController = Get.put(
      MusicGenreDataController(),
      tag: MusicGenreDataController().toString());
  NewEpisodeDataController _newEpisodeDataController = Get.put(
      NewEpisodeDataController(),
      tag: NewEpisodeDataController().toString());
  PlayBackDataController _playBackDataController = Get.put(
      PlayBackDataController(),
      tag: PlayBackDataController().toString());
  RadioStationDataController _radioStationDataController = Get.put(
      RadioStationDataController(),
      tag: RadioStationDataController().toString());
  SearchDataController _searchDataController =
      Get.put(SearchDataController(), tag: SearchDataController().toString());
  SettingsDataContoller _settingsDataContoller =
      Get.put(SettingsDataContoller(), tag: SettingsDataContoller().toString());

  bool isDarkModeOn;
  setThemeMode() {
    isDarkModeOn = prefs.read<bool>('isDarkModeOn');
    _themeController.isDarkModeUpdate(isDarkModeOn ?? false);
    _playBackDataController.changeUiModeUpdate(isDarkModeOn ?? false);
  }

  @override
  void initState() {
    setThemeMode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ColorData.color_0xff533c80,
        accentColor: ColorData.color_0xff533c80,
        splashColor: ColorData.color_0xff533c80,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: !_themeController.isDarkMode
              ? ColorData.color_0xff1d192c
              : ColorData.color_0xff533c80,
          selectionHandleColor: !_themeController.isDarkMode
              ? ColorData.color_0xff1d192c
              : ColorData.color_0xff533c80,
          selectionColor: !_themeController.isDarkMode
              ? ColorData.color_0xff1d192c
              : ColorData.color_0xff533c80,
        ),
      ),
      home: SplashScreen(),
    );
  }
}
