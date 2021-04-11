import 'package:bogdashka/components/TextLayout4.dart';
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
) {
  return Flex(direction: Axis.vertical, children: [
    Container(
      width: widthCont,
      height: heightCont,
      decoration: BoxDecoration(
          color: darkPrimaryColor,
          borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(5.0),
            topRight: const Radius.circular(5.0),
          )),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Spacer(),
          Container(
            height: 40,
            width: 40,
            child: Image.asset(imgPath),
          ),
          Spacer(),
          Text(
            topMiddelText,
            style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w900,
                letterSpacing: 2.0),
          ),
          Spacer(),
        ],
      ),
    ),
    Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.only(
            bottomLeft: const Radius.circular(5.0),
            bottomRight: const Radius.circular(5.0),
          )),
      width: widthCont,
      height: 75,
      child: Flex(
        direction: Axis.vertical,
        children: [
          Spacer(),
          Center(
            child: Text(
              bottomMiddelText,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: Container()),
          Center(
            child: Text(
              bottomNormalText,
              style: TextStyle(
                  fontSize: 13,
                  color: darkPrimaryColor,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2.0),
            ),
          ),
          Spacer(),
        ],
      ),
    )
  ]);
}
