import 'package:bogdashka/components/TextLayout4.dart';
import 'package:bogdashka/helper/Constants.dart';
import 'package:bogdashka/screens/payCheck/PayCheck_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget getBottomNavigationBarMainScreen(BuildContext context) {
  return Container(
      height: bottomNavigatorHeight,
      color: Theme.of(context).appBarTheme.color,
      child: Row(
        children: [
          Spacer(),
          InkWell(
              onTap: () => {launch('https://vk.com/bogdashkacomlittle')},
              child: TextLayouth4('Обратится в тех поддержку')),
          Spacer(),
          Image(
            image: new AssetImage('images/vk.png'),
            height: 20.0,
            width: 20,
          ),
          Container(
            margin: const EdgeInsets.only(left: 5.0, right: 5.0),
            child: Container(),
          ),
          InkWell(
              onTap: () => {launch('https://vk.com/bogdashka_com')},
              child: TextLayouth4('vk.com/bogdashka_com')),
          Spacer(),
          InkWell(
              onTap: () => {Navigator.pushNamed(context, PayCheck.path)},
              child: TextLayouth4('Проверить покупки')),
          Spacer(),
        ],
      ));
}
