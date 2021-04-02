import 'package:bogdashka/screens/log_pass/widgets/LogPassCardBody.dart';
import 'package:bogdashka/screens/main/widgets/AppBarMainScreen.dart';
import 'package:bogdashka/screens/main/widgets/BottomNavigationBarMainScreen.dart';

import 'package:flutter/material.dart';

class LogPassScreen extends StatelessWidget {
  static String path = '/log_pass';
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
                          LogPassCardBody(),
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
