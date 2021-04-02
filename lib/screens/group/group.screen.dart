import 'package:bogdashka/screens/group/widgets/GroupCardBody.dart';
import 'package:bogdashka/screens/main/widgets/AppBarMainScreen.dart';
import 'package:bogdashka/screens/main/widgets/BottomNavigationBarMainScreen.dart';

import 'package:flutter/material.dart';

class GroupScreen extends StatelessWidget {
  static String path = '/group/pay';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarMainScreen(context),
        bottomNavigationBar: getBottomNavigationBarMainScreen(context),
        body: Container(
            child: Container(
          child: Flex(
            mainAxisAlignment: MainAxisAlignment.center,
            direction: Axis.vertical,
            children: [
              Flex(
                mainAxisAlignment: MainAxisAlignment.center,
                direction: Axis.horizontal,
                children: [
                  Spacer(),
                  Center(
                    child: Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flex(direction: Axis.horizontal, children: [
                          GroupCard(),
                        ]),
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ],
          ),
        )));
  }
}
