import 'package:flutter/material.dart';

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

const mainPrimariColor = Color(215363);
const kPrimaryColor = Colors.black;
const kSecondaryColor = Colors.black;

const kBackgroundColor = Color(0xFFE7EEF0);
const kRedColor = Color(0xFFFF6960);
const lightPrimaryColor = Colors.white;
const darkPrimaryColor = Color(0xFFF9CB08);

const redColors = Color(0xFFB71C1C);
const kSecondaryLightColor = Color(0xFFE4E9F2);
const kSecondaryDarkColor = Color(0xFF404040);
const kAccentLightColor = Color(0xFFB3BFD7);
const kAccentDarkColor = Color(0xFF4E4E4E);
const kBackgroundDarkColor = Color(0xFF3A3A3A);
const kSurfaceDarkColor = Color(0xFF222225);
// Icon Colors
const kAccentIconLightColor = Color(0xFFECEFF5);
const kAccentIconDarkColor = Color(0xFF303030);
const kPrimaryIconLightColor = Color(0xFFECEFF5);
const kPrimaryIconDarkColor = Color(0xFF232323);
// Text Colors
const kBodyTextColorLight = Color(0xFFA1B0CA);
const kBodyTextColorDark = Color(0xFFECEFF5);
const kTitleTextLightColor = Color(0xFF101112);
const kTitleTextDarkColor = Colors.white;
// fffdfd
const kShadowColor = Color(0xFF364564);
const colorCard = Color(0xFF343434);
final colorCardBottom = _colorFromHex('#262626');

Map<String, double> getAppBarSize(BuildContext context) {
  final double widthBar = MediaQuery.of(context).size.width;
  return {'height': 65.0, 'width': widthBar};
}

const bottomNavigatorHeight = 100.0;
