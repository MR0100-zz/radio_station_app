import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_station/controller/home/home_controller.dart';
import 'package:radio_station/model/bottom_navigation_bar_data_model.dart';
import 'package:radio_station/utilities/assets_utils.dart';
import 'package:radio_station/view/custom_widgets/custom_bottom_navigation_bar.dart';
import 'package:radio_station/view/home/events_screen/event_screen.dart';
import 'package:radio_station/view/home/home_screen/home_screen.dart';
import 'package:radio_station/view/home/music_library_screen/music_library_screen.dart';
import 'package:radio_station/view/home/profile_screen/profile_screen.dart';
import 'package:radio_station/view/home/radio_station_screen/radio_station_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeController _homeController = Get.find(tag: HomeController().toString());
  PageController _homePageController;

  @override
  void initState() {
    _homePageController = PageController(
      initialPage: 0,
    );
    super.initState();
  }

  List<BottomNavigationBarData> bottomNavigationBarDataList = [
    BottomNavigationBarData(
      currentIndex: 0,
      name: "Home",
      image: AssetData.homeSvg,
      screen: HomeScreen(),
    ),
    BottomNavigationBarData(
      currentIndex: 1,
      name: "Music Library",
      image: AssetData.librarySvg,
      screen: MusicLibraryScreen(),
    ),
    BottomNavigationBarData(
      currentIndex: 2,
      name: "Radio Station",
      image: AssetData.radioStationSvg,
      screen: RadioStationScreen(),
    ),
    BottomNavigationBarData(
      currentIndex: 3,
      name: "Events",
      image: AssetData.eventSvg,
      screen: EventScreen(),
    ),
    BottomNavigationBarData(
      currentIndex: 4,
      name: "Profile",
      image: AssetData.profileSvg,
      screen: ProfileScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return GetBuilder<HomeController>(
      init: _homeController,
      builder: (_) {
        return Scaffold(
          body: PageView(
            controller: _homePageController,
            physics: NeverScrollableScrollPhysics(),
            children: bottomNavigationBarDataList
                .map((BottomNavigationBarData e) => e.screen)
                .toList(),
          ),
          bottomNavigationBar: CustomBottomNavigationBar(
            screenSize: screenSize,
            bottomNavigationBarDataList: bottomNavigationBarDataList,
            currentIndex: _homeController.currentHomeIndex,
            onChange: (int currentPageSelectedIndex) {
              _homeController.currentHomeIndexUpdate(currentPageSelectedIndex);
              // _homePageController.animateToPage(currentPageSelectedIndex,
              //     duration: Duration(milliseconds: 200),
              //     curve: Curves.easeInOut);
              _homePageController.jumpToPage(
                currentPageSelectedIndex,
              );
            },
          ),
        );
      },
    );
  }
}
