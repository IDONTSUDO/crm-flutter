import 'package:bogdashka/components/TextLayouth4.dart';
import 'package:bogdashka/components/widgets/Navigator.animation.dart';
import 'package:bogdashka/helper/Constants.dart';
import 'package:flutter/material.dart';

Widget getBoxContainer(
    BuildContext context,
    double widthCont,
    double heightCont,
    String topMiddelText,
    String imgPath,
    String bottomMiddelText,
    String bottomNormalText,
    Widget setPage) {
  // TODO: REFACT
  return Flex(direction: Axis.vertical, children: [
    Container(
      width: widthCont,
      height: heightCont,
      color: darkPrimaryColor,
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Spacer(),
          Image(
            image: new AssetImage(imgPath),
            height: 20.0,
            width: 20,
          ),
          Container(
              margin: const EdgeInsets.only(left: 5.0, right: 5.0),
              child: Container()),
          Center(
            child: Text(
              topMiddelText,
              style: TextStyle(fontSize: 13, color: Colors.black),
            ),
          ),
          Spacer(),
        ],
      ),
    ),
    Container(
      width: widthCont,
      height: heightCont,
      color: Colors.white,
      child: Flex(
        direction: Axis.vertical,
        children: [
          Spacer(),
          Center(
            child: Text(
              bottomMiddelText,
              style: TextStyle(fontSize: 13, color: Colors.black),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: Container()),
          Center(
            child: Text(
              bottomNormalText,
              style: TextStyle(fontSize: 13, color: darkPrimaryColor),
            ),
          ),
          Spacer(),
        ],
      ),
    )
  ]);
}
