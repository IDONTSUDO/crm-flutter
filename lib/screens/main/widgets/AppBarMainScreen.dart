import 'package:bogdashka/components/SwitcherTheme.dart';
import 'package:bogdashka/components/widgets/Navigator.animation.dart';

import 'package:bogdashka/helper/Constants.dart';
import 'package:bogdashka/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

double sideLength = 50;

AppBar appBarMainScreen(BuildContext context) {
  final appBar = getAppBarSize(context);
  return AppBar(
    automaticallyImplyLeading: false,
    toolbarHeight: appBar['height'],
    title: Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20.0, right: 10.0),
          child: Container(),
        ),
        InkWell(
            onTap: () =>
                // Navigator.push(context, SlideRightRoute(page: Screen2()))
                {navigationSideRoute(context, MainScreen())},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                image: new AssetImage('images/logo.png'),
                height: 92.0,
                width: 200,
              ),
            )),
        Spacer(),
        AnimatedContainer(
          height: sideLength,
          width: 200,
          duration: Duration(seconds: 2),
          curve: Curves.easeIn,
          child: Material(
            color: Theme.of(context).backgroundColor,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).accentColor,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(2),
              ),
              child: InkWell(
                child: Row(
                  children: [
                    Spacer(),
                    Text(
                      'message',
                      style: TextStyle(
                          color: Theme.of(context).accentColor, fontSize: 13),
                    ),
                    Spacer(),
                  ],
                ),
                onTap: () {
                  launch('https://vk.com/topic-199352331_46459026');
                },
              ),
            ),
          ),
        ),
        Spacer(),
        // ВЫБЕРЕТЕ РЕЖИМ
        SwitcherTheme(),
        Container(
          margin: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Container(),
        ),
        AnimatedContainer(
          height: appBar['height'],
          width: 150,
          duration: Duration(seconds: 2),
          curve: Curves.easeIn,
          child: Material(
            color: Theme.of(context).primaryColor,
            child: InkWell(
              child: Row(
                children: [
                  Image(
                    image: new AssetImage('images/backet.png'),
                    height: 30.0,
                    width: 30,
                  ),
                  Spacer(),
                  Text(
                    'Купить робуксы',
                    style: TextStyle(color: kSecondaryColor, fontSize: 13),
                  ),
                  Spacer(),
                ],
              ),
              onTap: () {},
            ),
          ),
        ),
        Spacer(),
      ],
    ),
  );
}
