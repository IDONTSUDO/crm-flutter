import 'package:bogdashka/components/BlurryDialog.dart';
import 'package:bogdashka/components/BoxContainer.dart';
import 'package:bogdashka/components/widgets/Notification.dart';
import 'package:bogdashka/components/widgets/ThemeComponents.dart';
import 'package:bogdashka/helper/Constants.dart';
import 'package:bogdashka/screens/main/widgets/group/GroupCardBody.dart';
import 'package:bogdashka/screens/main/widgets/log_pass/LogPassCardBody.dart';
import 'package:flutter/material.dart';

import 'Service.techJob.dart';
import 'log_pass/LogPassCardBodyV1.dart';
import 'transfer/TransferCardBody.dart';

// ignore: must_be_immutable
class BuyRoboxStep extends StatelessWidget {
  double setingGrroup;
  double settingLogPass;
  double settingsTransfer;
  BuyRoboxStep(this.setingGrroup, this.settingLogPass, this.settingsTransfer);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeighStep(context),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 100.0, bottom: 100.0),
            child: Column(children: [
              Flex(
                  mainAxisAlignment: MainAxisAlignment.center,
                  direction: Axis.horizontal,
                  children: [
                    ThemeComponent(
                        Container(
                          child: Text(
                            'Купить робуксы THEME LIGHT',
                            style:
                                TextStyle(color: kSecondaryColor, fontSize: 28),
                          ),
                        ),
                        Container(
                          child: Flex(
                            direction: Axis.horizontal,
                            children: [
                              Center(
                                child: Image(
                                  image: new AssetImage(lightBacketSrc),
                                  height: 30.0,
                                  width: 30,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20.0, right: 1.0),
                                child: Container(),
                              ),
                              Text(
                                'Купить робуксы',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 28),
                              ),
                            ],
                          ),
                        ))
                  ])
            ]),
          ),
          Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flex(direction: Axis.horizontal, children: [
                Container(
                  margin: EdgeInsets.only(left: 20.0, right: 10.0),
                  child: Container(),
                ),
                Container(
                  child: InkWell(
                    child: getBoxContainer(
                        context,
                        250.0,
                        100.0,
                        'ГРУППОВОЙ МЕТОД',
                        imageGroupSrc,
                        '1р = $setingGrroup R\$',
                        '3.569 R\$ доступно'),
                    onTap: () => {_showDialog(context, GroupCard())},
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                  child: Container(),
                ),
                Container(
                  child: InkWell(
                    child: getBoxContainer(
                      context,
                      250.0,
                      100.0,
                      'LOG+PASS        ',
                      logPassDarkSrc,
                      '1р = $settingLogPass R\$',
                      '3.569 R\$ доступно',
                    ),
                    onTap: () => {_showDialog(context, LogPassCardBodyV1())},
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                  child: Container(),
                ),
                Container(
                  child: InkWell(
                    child: getBoxContainer(
                      context,
                      250.0,
                      100.0,
                      'Трансфер          ',
                      transferSrc,
                      '1р = $settingsTransfer R\$',
                      '3.569 R\$ доступно',
                    ),
                    onTap: () => {_showDialog(context, ServiceTechJob())},
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                  child: Container(),
                ),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}

_showDialog(BuildContext context, Widget body) {
  BlurryDialog alert = BlurryDialog(body);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Stack(
        children: [alert, NotificationPopover()],
      );
    },
  );
}
