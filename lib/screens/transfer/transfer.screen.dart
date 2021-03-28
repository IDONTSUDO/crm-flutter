import 'package:bogdashka/components/BoxContainer.dart';

import 'package:bogdashka/controllers/CourseController.dart';
import 'package:bogdashka/helper/Constants.dart';
import 'package:bogdashka/models/Settings.dart';
import 'package:bogdashka/screens/main/widgets/AppBarMainScreen.dart';
import 'package:bogdashka/screens/main/widgets/BottomNavigationBarMainScreen.dart';

import 'package:flutter/material.dart';

import '../../main.dart';
import 'widgets/TransferCardBody.dart';

class TransferScreen extends StatelessWidget {
  static String path = '/transfer/pay';
  @override
  Widget build(BuildContext context) {
    iSettingsBlock.getInvest();
    final appBar = getAppBarSize(context);
    return Scaffold(
        appBar: appBarMainScreen(context),
        bottomNavigationBar: getBottomNavigationBarMainScreen(context),
        body: StreamBuilder<List<ISettings>>(
            stream: iSettingsBlock.subject,
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return buildLoadingWidget();
              } else {
                double setingGrroup = snapshot.data[0].course;
                double settingLogPass = snapshot.data[1].course;
                double settingsTransfer = snapshot.data[2].course;

                return Container(
                  child: Column(
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.only(top: 100.0, bottom: 100.0),
                        child: Column(children: [
                          Container(
                            child: Text(
                              'Купить робуксы',
                              style: TextStyle(
                                  color: kSecondaryColor, fontSize: 28),
                            ),
                          )
                        ]),
                      ),
                      Flex(
                        direction: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flex(
                              direction: Axis.horizontal,
                              children: [TransferCardBody()]),
                        ],
                      ),
                    ],
                  ),
                );
              }
            }));
  }
}
