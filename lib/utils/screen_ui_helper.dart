import 'package:dealer/src/colors.dart';
import 'package:dealer/src/configs.dart';
import 'package:flutter/material.dart';

class ScreenUiHelper {
  late double width;
  late double height;

  late double blockSizeHorizontal;
  late double blockSizeVertical;

  late double headlineSize;
  late double titleSize;
  late double bodySize;

  late TextStyle headline;
  late TextStyle title;
  late TextStyle body;
  late TextStyle buttonStyle;

  late TextStyle headlineTextStyle;
  late TextStyle titleTextStyle;
  late TextStyle bodyTextStyle;
  late TextStyle buttonTextStyle;


  late SizedBox verticalSpaceLow;
  late SizedBox verticalSpaceMedium;
  late SizedBox verticalSpaceHigh;

  late SizedBox horizontalSpaceLow;
  late SizedBox horizontalSpaceMedium;
  late SizedBox horizontalSpaceHigh;

  ScreenUiHelper.fromContext(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double screenWidth = mediaQuery.size.width;
    double screenHeight = mediaQuery.size.height;
    width = screenWidth;
    height = screenHeight;

    headlineSize = 20;
    titleSize = 16;
    bodySize = 12;

    headline = TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimaryColor,
        fontSize: headlineSize,
        decoration: TextDecoration.none,
        fontFamily: SystemProperties.titleFont);

    title = TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: titleSize,
        color: AppColors.textPrimaryColor,
        decoration: TextDecoration.none,
        fontFamily: SystemProperties.titleFont);

    buttonStyle = TextStyle(
        fontFamily: SystemProperties.titleFont,
        decoration: TextDecoration.none,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimaryColor,
        fontSize: bodySize);

    body = TextStyle(
        color: AppColors.textSecondaryColor,
        fontWeight: FontWeight.w400,
        fontSize: bodySize,
        decoration: TextDecoration.none,
        fontFamily: SystemProperties.fontName);

    headlineTextStyle = TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: headlineSize,
        decoration: TextDecoration.none,
        fontFamily: SystemProperties.titleFont);

    titleTextStyle = TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: titleSize,
        decoration: TextDecoration.none,
        fontFamily: SystemProperties.titleFont);
    buttonTextStyle = TextStyle(
        fontFamily: SystemProperties.titleFont,
        decoration: TextDecoration.none,
        fontWeight: FontWeight.bold,
        fontSize: bodySize);

    bodyTextStyle = TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: bodySize,
        decoration: TextDecoration.none,
        fontFamily: SystemProperties.fontName);

    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    verticalSpaceLow = SizedBox(
      height: blockSizeVertical * 1.5,
    );
    verticalSpaceMedium = SizedBox(
      height: blockSizeVertical * 4,
    );
    verticalSpaceHigh = SizedBox(
      height: blockSizeVertical * 6,
    );

    horizontalSpaceLow = SizedBox(
      width: blockSizeHorizontal * 1.5,
    );
    horizontalSpaceMedium = SizedBox(
      width: blockSizeHorizontal * 7,
    );
    horizontalSpaceHigh = SizedBox(
      width: blockSizeHorizontal * 11,
    );

  }
}
