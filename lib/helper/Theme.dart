import 'package:bogdashka/helper/Constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// @problem Возвращает тему
/// если тема темная то возвращает False
/// если светлая то true
bool getThemeMode(BuildContext context) {
  if (Theme.of(context).primaryColor == lightPrimaryColor) {
    return true;
  } else {
    return false;
  }
}

ThemeData themeData(BuildContext context) {
  return ThemeData(
    fontFamily: 'Montserrat',
    // appBarTheme: appBarTheme,
    primaryColor: lightPrimaryColor,
    accentColor: Colors.black,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(
      secondary: kSecondaryLightColor,
    ),
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: kBodyTextColorLight),
  );
}

// Dark Them
ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: darkPrimaryColor,
    accentColor: Colors.white,
    scaffoldBackgroundColor: Color(0xFF0D0C0E),
    appBarTheme: appBarThemeDark,
    colorScheme: ColorScheme.light(
      secondary: kSecondaryDarkColor,
      surface: kSurfaceDarkColor,
    ),
    backgroundColor: Colors.black,
    iconTheme: IconThemeData(color: kBodyTextColorDark),
    accentIconTheme: IconThemeData(color: kAccentIconDarkColor),
    primaryIconTheme: IconThemeData(color: kPrimaryIconDarkColor),
  );
}

AppBarTheme appBarThemeDark = AppBarTheme(color: Colors.black, elevation: 1);
