import 'dart:ui';
import 'package:get/get.dart';
import 'package:radio_station/model/connected_device_data_model.dart';
import 'package:radio_station/utilities/assets_utils.dart';

/// THIS CLASS CONTAINS DATA OF CONNECTED DEVICES SCREEN...
class ConnectedDeviceDataController extends GetxController {
  /// THIS LIST CONTAINS DATA OF ALL TILES IN CONNECTED DEVICES SCREEN...
  final List<ConnectedDeviceDataModel> connectedDeviceDataList = [
    ConnectedDeviceDataModel(
      title: "Computer",
      iconBgColor: Color(0xFFEA4335),
      svgUrl: AssetData.monitorSvg,
    ),
    ConnectedDeviceDataModel(
      title: "TV",
      iconBgColor: Color(0xFFFBBC04),
      svgUrl: AssetData.tvSvg,
    ),
    ConnectedDeviceDataModel(
      title: "Wi-Fi Speakers",
      iconBgColor: Color(0xFF9D00FF),
      svgUrl: AssetData.speakerSvg,
    ),
    ConnectedDeviceDataModel(
      title: "Chromecast",
      iconBgColor: Color(0xFF34A853),
      svgUrl: AssetData.googleCastSvg,
    ),
    ConnectedDeviceDataModel(
      title: "Bluetooth",
      iconBgColor: Color(0xFF0083FD),
      svgUrl: AssetData.bluetoothSvg,
    ),
  ];
}
