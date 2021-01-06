import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

ThemeData buildThemeData(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: kBackgroundColor,
    textTheme: GoogleFonts.manropeTextTheme(Theme.of(context).textTheme),
    dividerColor: Color(0xFFE7EEF0),
    iconTheme: IconThemeData(color: kDefualtIconColor, size: 20),
  );
}
