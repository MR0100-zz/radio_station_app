import 'package:flutter/material.dart';

import 'color_utils.dart';

/// THIS ENUM IS USED TO MANAGE FONT WEIGHT...
enum FWT {
  light, // 200
  regular, //400
  medium, // 500
  semiBold, // 600
  bold, //700
}

/// THIS FUNCTION IS USED TO SET FONT WEIGHT ACCORDING TO SELECTED ENUM...
FontWeight getFontWeigth(FWT fwt) {
  switch (fwt) {
    case FWT.light:
      return FontWeight.w200;
      break;
    case FWT.regular:
      return FontWeight.w400;
      break;
    case FWT.medium:
      return FontWeight.w500;
      break;
    case FWT.semiBold:
      return FontWeight.w600;
      break;
    case FWT.bold:
      return FontWeight.w700;
      break;
    default:
      return FontWeight.w200;
  }
}

/// THIS CLASS DEFINES ALL THE TEXTSTYLES USED IN THE APPLICATION...
class FontStyleData {
  /// FONTSTYLE FOR FONT SIZE 31
  static TextStyle h31({
    @required Color fontColor,
    FWT fontWeight = FWT.regular,
  }) {
    return TextStyle(
      color: fontColor ?? ColorData.color_0xffffffff,
      fontWeight: getFontWeigth(fontWeight),
      fontSize: 31,
    );
  }

  /// FONTSTYLE FOR FONT SIZE 30
  static TextStyle h30({
    @required Color fontColor,
    FWT fontWeight = FWT.regular,
  }) {
    return TextStyle(
      color: fontColor ?? ColorData.color_0xffffffff,
      fontWeight: getFontWeigth(fontWeight),
      fontSize: 30,
    );
  }

  /// FONTSTYLE FOR FONT SIZE 23
  static TextStyle h23({
    @required Color fontColor,
    FWT fontWeight = FWT.regular,
  }) {
    return TextStyle(
      color: fontColor ?? ColorData.color_0xffffffff,
      fontWeight: getFontWeigth(fontWeight),
      fontSize: 23,
    );
  }

  /// FONTSTYLE FOR FONT SIZE 20
  static TextStyle h20({
    @required Color fontColor,
    FWT fontWeight = FWT.regular,
  }) {
    return TextStyle(
      color: fontColor ?? ColorData.color_0xffffffff,
      fontWeight: getFontWeigth(fontWeight),
      fontSize: 20,
    );
  }

  /// FONTSTYLE FOR FONT SIZE 16
  static TextStyle h16({
    @required Color fontColor,
    FWT fontWeight = FWT.regular,
  }) {
    return TextStyle(
      color: fontColor ?? ColorData.color_0xffffffff,
      fontWeight: getFontWeigth(fontWeight),
      fontSize: 16,
    );
  }

  /// FONTSTYLE FOR FONT SIZE 14
  static TextStyle h14({
    @required Color fontColor,
    FWT fontWeight = FWT.regular,
  }) {
    return TextStyle(
      color: fontColor ?? ColorData.color_0xffffffff,
      fontWeight: getFontWeigth(fontWeight),
      fontSize: 14,
    );
  }

  /// FONTSTYLE FOR FONT SIZE 13
  static TextStyle h13({
    @required Color fontColor,
    FWT fontWeight = FWT.regular,
  }) {
    return TextStyle(
      color: fontColor ?? ColorData.color_0xffffffff,
      fontWeight: getFontWeigth(fontWeight),
      fontSize: 13,
    );
  }

  /// FONTSTYLE FOR FONT SIZE 12
  static TextStyle h12({
    @required Color fontColor,
    FWT fontWeight = FWT.regular,
  }) {
    return TextStyle(
      color: fontColor ?? ColorData.color_0xffffffff,
      fontWeight: getFontWeigth(fontWeight),
      fontSize: 12,
    );
  }

  /// FONTSTYLE FOR FONT SIZE 11
  static TextStyle h11({
    @required Color fontColor,
    FWT fontWeight = FWT.regular,
  }) {
    return TextStyle(
      color: fontColor ?? ColorData.color_0xffffffff,
      fontWeight: getFontWeigth(fontWeight),
      fontSize: 11,
    );
  }

  /// FONTSTYLE FOR FONT SIZE 10
  static TextStyle h10({
    @required Color fontColor,
    FWT fontWeight = FWT.regular,
  }) {
    return TextStyle(
      color: fontColor ?? ColorData.color_0xffffffff,
      fontWeight: getFontWeigth(fontWeight),
      fontSize: 10,
    );
  }

  /// FONTSTYLE FOR FONT SIZE 9
  static TextStyle h9({
    @required Color fontColor,
    FWT fontWeight = FWT.regular,
  }) {
    return TextStyle(
      color: fontColor ?? ColorData.color_0xffffffff,
      fontWeight: getFontWeigth(fontWeight),
      fontSize: 9,
    );
  }

  /// FONTSTYLE FOR FONT SIZE 8
  static TextStyle h8({
    @required Color fontColor,
    FWT fontWeight = FWT.regular,
  }) {
    return TextStyle(
      color: fontColor ?? ColorData.color_0xffffffff,
      fontWeight: getFontWeigth(fontWeight),
      fontSize: 9,
    );
  }
}
