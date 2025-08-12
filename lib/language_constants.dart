import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_localizations.dart';

const String languagCode = 'languageCode';

const String english = 'en';
const String hungarian = 'hu';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(languagCode, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String languageCode = prefs.getString(languagCode) ?? "en";
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case english:
      return const Locale(english, 'US');
    case hungarian:
      return const Locale(hungarian, "HU");
    default:
      return const Locale(english, 'US');
  }
}

String getTranslated(BuildContext context, String key) {
  return AppLocalization.of(context) != null
      ? AppLocalization.of(context)!.translate(key)!
      : "";
}
