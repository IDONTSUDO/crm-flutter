import 'package:bogdashka/components/TextLayout3.dart';
import 'package:bogdashka/helper/Constants.dart';
import 'package:flutter/material.dart';

Widget getBoxContainerCard(
    BuildContext context,
    double widthCont,
    double heightCont,
    String topMiddelText,
    String imgPath,
    String bottomMiddelText,
    Widget body) {
  return Flex(direction: Axis.vertical, children: [
    InkWell(
      onTap: () => {},
      child: Container(
        width: widthCont,
        height: 70,
        color: darkPrimaryColor,
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Container(
                margin: const EdgeInsets.only(left: 2.0, right: 2.0),
                child: Container()),
            Image(
              image: new AssetImage(imgPath),
              height: 40.0,
              width: 40,
            ),
            Container(
                margin: const EdgeInsets.only(left: 3.0, right: 3.0),
                child: Container()),
            TextLayouth3(topMiddelText),
            Spacer(),
          ],
        ),
      ),
    ),
    Container(width: widthCont, child: body)
  ]);
}
