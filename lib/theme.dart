import 'package:flutter/material.dart';

class AppColors {
  static Color defaultTextColor = Colors.white;
  static Color entryColor = const Color(0xFFFFFFFF);
  static Color radioTextColor = const Color(0xFFFFFFFF);
  static Color entryHintColor = Colors.white;
  static Color defaultEntryColor = Colors.blueGrey;
  static Color defaultEntryCursorColor = Colors.white;
  static Color infoTextColor = Colors.white;
  static Color defaultScaffoltBackgroundColor = Colors.black;
}

class TextStyles {
  static String defaultFamily = "DMSans";

  static TextStyle defaultRadioTextStyle = TextStyle(
    fontFamily: defaultFamily,
    fontSize: 16,
    color: AppColors.radioTextColor,
    fontWeight: FontWeight.w400,
  );

  static TextStyle operatorWorkloadTitleTextStyle = TextStyle(
    fontFamily: defaultFamily,
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static TextStyle operatorWorkloadAltTitleTextStyle = TextStyle(
    fontFamily: defaultFamily,
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle operatorWorkloadDescriptionTextStyle = TextStyle(
    fontFamily: defaultFamily,
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w300,
  );

  static TextStyle infoTextStyle = TextStyle(
    fontFamily: defaultFamily,
    fontSize: 14,
    color: AppColors.infoTextColor,
    fontWeight: FontWeight.w400,
  );

  static TextStyle defaultAppBarTextStyle = TextStyle(
    fontFamily: defaultFamily,
    fontSize: 20,
    color: AppColors.defaultTextColor,
    fontWeight: FontWeight.w500,
  );

  static TextStyle entryHintTextStyle = TextStyle(
    fontFamily: defaultFamily,
    color: AppColors.entryHintColor,
    fontSize: 17,
    fontWeight: FontWeight.w400,
  );

  static TextStyle entryTitleTextStyle = TextStyle(
    fontFamily: defaultFamily,
    color: AppColors.entryColor,
    fontSize: 17,
    fontWeight: FontWeight.w500,
  );

  static TextStyle noDataListTextStyle = TextStyle(
    fontFamily: defaultFamily,
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );
}
