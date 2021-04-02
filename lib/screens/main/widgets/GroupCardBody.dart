import 'package:bogdashka/components/RoboxPatButton.dart';
import 'package:bogdashka/components/TextLayouth1.dart';
import 'package:bogdashka/components/widgets/BoxFormTopTextLeftImage.dart';
import 'package:bogdashka/components/widgets/BoxFornTopText.dart';
import 'package:bogdashka/controllers/Settings.controller.dart';
import 'package:bogdashka/helper/Constants.dart';
import 'package:bogdashka/models/Settings.dart';
import 'package:bogdashka/service/Comerce.dart';
import 'package:flutter/material.dart';

import '../../../enums.dart';
import '../../../main.dart';

class GroupCard extends StatelessWidget {
  String text;
  final TextEditingController _controllerYouPay = new TextEditingController();
  final TextEditingController _controllerYouGet = new TextEditingController();
  final TextEditingController _controllerNickname = new TextEditingController();
  void eqw(String e) {}
  @override
  Widget build(BuildContext context) {
    ComercePay comercePay;
    return StreamBuilder<List<ISettings>>(
        stream: settingsController.subject,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return buildLoadingWidget();
          } else {
            ISettings snap;
            snapshot.data.forEach((element) {
              if (element.id == 'group') {
                snap = element;
              }
            });
            comercePay = ComercePay(
                snap.maxRoboxPay,
                ComerceOperation.LOG_PASS,
                snap.mininalPay,
                snap.course,
                _controllerYouPay,
                _controllerYouGet);
            return Flex(
                mainAxisAlignment: MainAxisAlignment.start,
                direction: Axis.vertical,
                children: [
                  Container(
                    width: 350,
                    height: 70,
                    color: darkPrimaryColor,
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            child: Container()),
                        Image(
                          image: new AssetImage(lightLogPassSrc),
                          height: 40.0,
                          width: 40,
                        ),
                        Spacer(),
                        TextLayouth1('ГРУППОВОЙ МЕТОД'),
                        Spacer(),
                        Container(
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            child: Container()),
                      ],
                    ),
                  ),
                  Container(
                      width: 350,
                      child: Column(
                        children: [
                          Container(
                            color: colorCard,
                            height: 500,
                            width: 350,
                            child: Flex(
                              direction: Axis.vertical,
                              children: [
                                Spacer(),
                                BoxFormTopText(_controllerNickname,
                                    'Введите никнейм', eqw),
                                BoxFormTopTextLeftImage(
                                    _controllerYouPay,
                                    'images/R\$.png',
                                    'Вы получайте',
                                    comercePay.payComputedAtYouGetInput),
                                BoxFormTopTextLeftImage(
                                    _controllerYouGet,
                                    rubIconLightSrc,
                                    'Вы платите',
                                    comercePay.payComputedAtYouPayInput),
                                Spacer(),
                                Container(
                                  // color: Theme.of(context).primaryColor,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  width: 250,
                                  height: 80,
                                  child: InkWell(
                                    child: getRoboxPayBtn(),
                                    onTap: () {},
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                          )
                        ],
                      )),
                ]);
          }
        });
  }
}
