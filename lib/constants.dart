import 'package:flutter/material.dart';

/// [it contains all of our constants like color, textstyle..]

// Colors
const kPrimaryColor = Color(0xFF3F8FAC);
const kSecondaryColor = Color(0xFF215363);
const kBlueColor = Color(0xFF3092FF);
const kDeepBlueColor = Color(0xFF3D48A2);
const kOrangeColor = Color(0xFFFD7B38);
const kYelloColor = Color(0xFFFFAD11);
const kGreenColor = Color(0xFF60B158);
const kBackgroundColor = Color(0xFFE7EEF0);
const kRedColor = Color(0xFFFF6960);
const kDefualtIconColor = Color(0xFF616161);

const kDefaultPadding = 20.0;
const kDefaultDuration = Duration(milliseconds: 250);

final kDefualtShadow = BoxShadow(
  offset: Offset(0, 8),
  blurRadius: 22,
  spreadRadius: -6,
  color: Color(0xFF18274B).withOpacity(0.12),
);

const kMaxWidth = 1389.0;

final kDivider = Container(
  margin: EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.75),
  width: 1.8,
  height: 40,
  color: kBackgroundColor,
);

final kFilledInputDecoration = InputDecoration(
  filled: true,
  fillColor: kBackgroundColor,
  border: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(6),
  ),
);
