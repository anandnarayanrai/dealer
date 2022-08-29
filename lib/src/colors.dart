import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor = Color(0xFF001C52);
  static const primaryDarkColor = Color(0xFF00002a);
  static const primaryLightColor = Color(0xFF39427f);
  static const primaryAssentColor = Color(0xFF808080);
  static const textColor = Color(0xFF808080);
  static const textLightColor = Color(0xFF808080);
  static const errorColor = Color(0xFF808080);
  static const borderColor = Color(0xFFd7d9de);
  static const disabledColor = Color(0xFFdfdfdf);

  static Color surfaceColor = Color(0xFF112240);
  static Color backgroundColor = Color(0xFF071D34);
  static Color textPrimaryColor = Color(0xFFCCD6F6);
  static Color textSecondaryColor = Colors.white30;
  static Color dividerColor = Colors.white60;
  static Color disableColor = Color(0xFF767E90);
  static Color introTitle = Color(0xFFA03A85);
  static Color introNext = Color(0xFFF36E37);
  static Color blackPrimary = Color(0xFF1C1C1C);
  static Color whiteColor = Color(0xFFFCFCFF);
  static Color bottomItem = Color(0xFFB8BECC);
  static Color orangeColor = Color(0xFFFBB832);
  static Color darkOrangeColor = Color(0xFFF36E37);
  static Color bluePrimary = Color(0xFF32AAFF);
  static Color blackSolid = Color(0xFF000000);
  static Color bottomNavigationColor = Color(0xFFA03A85);
  static Color skyBlue = Color(0xFF32AAFF);
}

mixin lightColor {
  //** Theme Colors
  static Color primaryColor = const Color(0xFF31344B);
  static Color backgroundColor = const Color(0xFFe6e7ee);
  static Color surfaceColor = const Color(0xFFe6e7ee);

//** Text Colors
  static Color textPrimaryColor = const Color(0xFF31344B);
  static Color textSecondaryColor = const Color(0xFF44476A);

  //static Color dividerColor = Colors.grey[300];
  static Color dividerColor = const Color(0xE0E0E0FF);
}
mixin darkColor {
  //** Theme Colors
  static const primaryColor = Color(0xFF1EEBB3);
  static const backgroundColor = Color(0xFF071D34);
  static const surfaceColor = Color(0xFF112240);

  //**Text Colors
  static const Color textPrimaryColor = Color(0xFFCCD6F6);
  static const Color textSecondaryColor = Colors.white30;

  static const Color dividerColor = Colors.white60;
}
