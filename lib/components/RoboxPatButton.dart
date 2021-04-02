import 'package:bogdashka/helper/Constants.dart';
import 'package:flutter/material.dart';

Widget getRoboxPayBtn({int fontSizer, FontWeight font}) {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image(
          image: new AssetImage(backeLightSrc),
          height: 30.0,
          width: 30,
        ),
      ),
      Spacer(),
      Text(
        'КУПИТЬ РОБУКСЫ',
        style: TextStyle(
            fontSize: fontSizer != null ? fontSizer : 15,
            color: Colors.black,
            fontWeight: font != null ? font : FontWeight.w700),
      ),
      Spacer(),
    ],
  );
}
