import 'package:bogdashka/components/BlurryDialog.dart';
import 'package:bogdashka/components/BoxContainer.dart';
import 'package:bogdashka/components/widgets/Navigator.animation.dart';
import 'package:bogdashka/components/widgets/ThemeComponents.dart';
import 'package:bogdashka/helper/Constants.dart';
import 'package:bogdashka/screens/group/widgets/GroupCardBody.dart';
import 'package:bogdashka/screens/log_pass/log_pass.screen.dart';
import 'package:bogdashka/screens/log_pass/widgets/LogPassCardBody.dart';
import 'package:bogdashka/screens/transfer/transfer.screen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BuyRoboxStep extends StatelessWidget {
  double setingGrroup;
  double settingLogPass;
  double settingsTransfer;
  BuyRoboxStep(this.setingGrroup, this.settingLogPass, this.settingsTransfer);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 180,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 100.0, bottom: 100.0),
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
                                  image: new AssetImage('images/backet.l.png'),
                                  height: 30.0,
                                  width: 30,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 20.0, right: 1.0),
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
                  margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                  child: Container(),
                ),
                Container(
                  child: InkWell(
                    child: getBoxContainer(
                        context,
                        250.0,
                        100.0,
                        'ГРУППОВОЙ МЕТОД',
                        'images/group.png',
                        '1р = $setingGrroup R\$',
                        '3.569 R\$ доступно',
                        LogPassScreen()),
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
                        'images/log_pass_d.png',
                        '1р = $settingLogPass R\$',
                        '3.569 R\$ доступно',
                        LogPassScreen()),
                    onTap: () => {_showDialog(context, LogPassCardBody())},
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
                        'images/transfer.png',
                        '1р = $settingsTransfer R\$',
                        '3.569 R\$ доступно',
                        LogPassScreen()),
                    onTap: () => {_showDialog(context, GroupCard())},
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
  VoidCallback continueCallBack = () => {
        Navigator.of(context).pop(),
        // code on continue comes here
      };
  BlurryDialog alert = BlurryDialog(body);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
