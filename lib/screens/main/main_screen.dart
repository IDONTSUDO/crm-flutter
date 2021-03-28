import 'package:bogdashka/components/BoxContainer.dart';
import 'package:bogdashka/components/widgets/Navigator.animation.dart';

import 'package:bogdashka/controllers/CourseController.dart';
import 'package:bogdashka/helper/Constants.dart';
import 'package:bogdashka/models/Settings.dart';
import 'package:bogdashka/screens/log_pass/log_pass.screen.dart';
import 'package:bogdashka/screens/main/widgets/AppBarMainScreen.dart';
import 'package:bogdashka/screens/transfer/transfer.screen.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import 'widgets/BottomNavigationBarMainScreen.dart';

class MainScreen extends StatelessWidget {
  static String path = '/main';
  @override
  Widget build(BuildContext context) {
    iSettingsBlock.getInvest();
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
                          Flex(direction: Axis.horizontal, children: [
                            Container(
                              child: InkWell(
                                child: getBoxContainer(
                                    context,
                                    200.0,
                                    100.0,
                                    'Трансфер',
                                    'images/backet.png',
                                    '1р = $settingsTransfer R\$',
                                    '3.569 доступно',
                                    LogPassScreen()),
                                onTap: () => {
                                  navigationSideRoute(context, TransferScreen())
                                },
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 20.0, right: 10.0),
                              child: Container(),
                            ),
                            Container(
                              child: InkWell(
                                child: getBoxContainer(
                                    context,
                                    200.0,
                                    100.0,
                                    'LOG+PASS',
                                    'images/backet.png',
                                    '1р = $settingLogPass R\$',
                                    '3.569 доступно',
                                    LogPassScreen()),
                                onTap: () => {
                                  navigationSideRoute(context, LogPassScreen())
                                },
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 20.0, right: 10.0),
                              child: Container(),
                            ),
                            Container(
                              child: InkWell(
                                child: getBoxContainer(
                                    context,
                                    200.0,
                                    100.0,
                                    'ГРУППОВОЙ МЕТОД',
                                    'images/backet.png',
                                    '1р = $setingGrroup R\$',
                                    '3.569 доступно',
                                    LogPassScreen()),
                                onTap: () => {
                                  navigationSideRoute(context, LogPassScreen())
                                },
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ],
                  ),
                );
              }
            }));
  }
}
