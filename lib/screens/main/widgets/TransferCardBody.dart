import 'package:bogdashka/screens/main/widgets/RoboxPayButton.dart';
import 'package:bogdashka/components/TextLayouth3.dart';
import 'package:bogdashka/components/TextLayouth4.dart';
import 'package:bogdashka/controllers/Settings.controller.dart';

import 'package:bogdashka/helper/Constants.dart';
import 'package:bogdashka/models/Settings.dart';
import 'package:bogdashka/service/Comerce.dart';
import 'package:flutter/material.dart';

import '../../../enums.dart';
import '../../../main.dart';

class TransferCardBody extends StatefulWidget {
  @override
  _TransferCardBodyState createState() => _TransferCardBodyState();
}

class _TransferCardBodyState extends State<TransferCardBody> {
  int pay = 0;
  String yourPay;
  String getPay;
  String message = '';
  ComercePay comercePay;
  final TextEditingController _controllerYouPay = new TextEditingController();
  final TextEditingController _controllerYouGet = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ISettings>>(
        stream: settingsController.subject,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return buildLoadingWidget();
          } else {
            ISettings snap;
            snapshot.data.forEach((element) {
              if (element.id == 'log+pass') {
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
            return Flex(direction: Axis.vertical, children: [
              Container(
                width: 550,
                height: 70,
                color: darkPrimaryColor,
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 2.0, right: 2.0),
                        child: Container()),
                    Image(
                      image: new AssetImage(lightLogPassSrc),
                      height: 40.0,
                      width: 40,
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 3.0, right: 3.0),
                        child: Container()),
                    TextLayouth3('LOG + PASS'),
                    Spacer(),
                  ],
                ),
              ),
              Container(
                  width: 550,
                  child: Column(children: [
                    Container(
                        color: colorCard,
                        height: 250,
                        child: Flex(
                          direction: Axis.horizontal,
                          children: [
                            Spacer(),
                            Container(
                                width: 200,
                                margin: const EdgeInsets.only(
                                    top: 10.0,
                                    bottom: 10.0,
                                    left: 10,
                                    right: 10),
                                child: Flex(
                                  direction: Axis.vertical,
                                  children: [
                                    TextLayouth4('При покупке более 450'),
                                    TextLayouth4('робуксов Вы получите'),
                                    TextLayouth4('премиум подарок'),
                                    Spacer(),
                                    TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelStyle:
                                            TextStyle(color: Colors.white),
                                        labelText: 'Введите Ваш Логин',
                                      ),
                                    ),
                                    Container(height: 10),
                                    TextField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelStyle:
                                            TextStyle(color: Colors.white),
                                        labelText: 'Введите Ваш Пароль',
                                      ),
                                    ),
                                    Spacer(),
                                  ],
                                )),
                            // Spacer(),
                            Container(
                              width: 300,
                              child: Flex(
                                direction: Axis.vertical,
                                children: [
                                  Container(height: 10),
                                  Flex(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      direction: Axis.horizontal,
                                      children: [
                                        TextLayouth4('Вы получайте'),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                top: 5.0,
                                                bottom: 5.0,
                                                left: 5,
                                                right: 5)),
                                        Container(
                                          height: 50,
                                          width: 100,
                                          child: TextField(
                                            controller: _controllerYouPay,
                                            onChanged: (e) => {
                                              comercePay
                                                  .payComputedAtYouGetInput(e)
                                            },
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelStyle: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                top: 5.0,
                                                bottom: 5.0,
                                                left: 5,
                                                right: 5)),
                                        Image(
                                          image:
                                              new AssetImage(roboxIconLightSrc),
                                          height: 30.0,
                                          width: 30,
                                        ),
                                      ]),
                                  Spacer(),
                                  Flex(
                                      direction: Axis.horizontal,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextLayouth4('Вы платите'),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                top: 5.0,
                                                bottom: 5.0,
                                                left: 5,
                                                right: 5)),
                                        Container(
                                          height: 50,
                                          width: 100,
                                          child: TextField(
                                            onChanged: (e) => {
                                              comercePay
                                                  .payComputedAtYouPayInput(e)
                                            },
                                            controller: _controllerYouGet,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelStyle: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                top: 5.0,
                                                bottom: 5.0,
                                                left: 5,
                                                right: 5)),
                                        Image(
                                          image:
                                              new AssetImage(rubIconLightSrc),
                                          height: 30.0,
                                          width: 30,
                                        ),
                                      ]),
                                  Spacer(),
                                  Container(
                                    width: 165,
                                    height: 60,
                                    color: Theme.of(context).primaryColor,
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
                    Container(
                        color: colorCardBottom,
                        height: 150,
                        child: Row(
                          children: [
                            Spacer(),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 10.0, bottom: 10.0, left: 10, right: 10),
                              child: Flex(
                                direction: Axis.vertical,
                                children: [
                                  TextLayouth4('Внимание! В ближайшие  '),
                                  TextLayouth4('2 часа  Вам на почту придет'),
                                  TextLayouth4('Вам нужно в течении 1 минуты'),
                                  TextLayouth4('вписать его в это поле.'),
                                  Spacer(),
                                  Container(
                                    height: 50,
                                    width: 200,
                                    child: TextField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelStyle:
                                            TextStyle(color: Colors.white),
                                        labelText: 'Введите код',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Flex(
                              direction: Axis.vertical,
                              children: [
                                Spacer(),
                                Container(
                                  width: 150,
                                  height: 50,
                                  color: Theme.of(context).primaryColor,
                                  child: InkWell(
                                    child: Row(
                                      children: [
                                        Spacer(),
                                        Text(
                                          'Отправить код',
                                          style: TextStyle(
                                              color: kSecondaryColor,
                                              fontSize: 13),
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                    onTap: () {},
                                  ),
                                ),
                                Container(height: 10)
                              ],
                            ),
                            Spacer(),
                          ],
                        ))
                  ]))
            ]);
          }
        });
  }
}
