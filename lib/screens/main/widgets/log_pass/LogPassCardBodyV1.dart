import 'package:bogdashka/components/TextLayout1.dart';
import 'package:bogdashka/controllers/Settings.controller.dart';
import 'package:bogdashka/helper/Constants.dart';
import 'package:bogdashka/models/Settings.dart';
import 'package:bogdashka/service/Comerce_service.dart';
import 'package:flutter/material.dart';

import '../../../../enums.dart';
import '../../../../main.dart';

class LogPassCardBodyV1 extends StatefulWidget {
  @override
  _LogPassCardBodyV1State createState() => _LogPassCardBodyV1State();
  static double cardWidth = 300.0;
}

class _LogPassCardBodyV1State extends State<LogPassCardBodyV1> {
  int pay = 0;
  String yourPay;
  String getPay;
  String message = '';
  ComercePay comercePay;
  final TextEditingController _controllerYouPay = new TextEditingController();
  final TextEditingController _controllerYouGet = new TextEditingController();
  final TextEditingController _controllerYourNickName =
      new TextEditingController();
  final TextEditingController _controllerPassword = new TextEditingController();
  final TextEditingController _controllerSocialLink =
      new TextEditingController();
  void eqw(String s) {}
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
                _controllerYouGet,
                _controllerYourNickName,
                _controllerPassword);
            return Flex(direction: Axis.vertical, children: [
              Container(
                width: LogPassCardBodyV1.cardWidth,
                height: 70,
                color: darkPrimaryColor,
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 2.0, right: 2.0),
                        child: Container()),
                    Image(
                      image: new AssetImage(logPassLightSrc),
                      height: 40.0,
                      width: 40,
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 3.0, right: 3.0),
                        child: Container()),
                    TextLayouth1('LOG + PASS'),
                    Spacer(),
                  ],
                ),
              ),
              Container(
                  width: LogPassCardBodyV1.cardWidth,
                  child: Column(children: [
                    Container(
                        color: colorCard,
                        height: 430,
                        child: Flex(
                          direction: Axis.horizontal,
                          children: [
                            Spacer(),
                            Container(
                                width: 280,
                                margin: const EdgeInsets.only(
                                    top: 10.0,
                                    bottom: 10.0,
                                    left: 10,
                                    right: 10),
                                child:
                                    Flex(direction: Axis.vertical, children: [
                                  Row(
                                    children: [
                                      Container(
                                          margin: const EdgeInsets.only(
                                              top: 5.0,
                                              bottom: 5.0,
                                              left: 35,
                                              right: 5)),
                                      Container(
                                        width: 200,
                                        child: TextField(
                                          controller: _controllerYouGet,
                                          onChanged: (e) => {
                                            comercePay
                                                .payComputedAtYouPayInput(e)
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelStyle:
                                                TextStyle(color: Colors.white),
                                            labelText: 'Вы получайте',
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
                                    ],
                                  ),
                                  Container(height: 10),
                                  Row(
                                    children: [
                                      Container(
                                          margin: const EdgeInsets.only(
                                              top: 5.0,
                                              bottom: 5.0,
                                              left: 35,
                                              right: 5)),
                                      Container(
                                        width: 200,
                                        child: TextField(
                                          controller: _controllerYouPay,
                                          onChanged: (e) => {
                                            comercePay
                                                .payComputedAtYouGetInput(e)
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelStyle:
                                                TextStyle(color: Colors.white),
                                            labelText: 'Вы платите',
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
                                        image: new AssetImage(rubIconLightSrc),
                                        height: 30.0,
                                        width: 30,
                                      ),
                                    ],
                                  ),
                                  Container(height: 10),
                                  Spacer(),
                                  Container(
                                    width: 200,
                                    child: TextField(
                                      controller: _controllerYourNickName,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelStyle:
                                            TextStyle(color: Colors.white),
                                        labelText: 'Введите Ваш Логин',
                                      ),
                                    ),
                                  ),
                                  Container(height: 10),
                                  Container(
                                    width: 200,
                                    child: TextField(
                                      controller: _controllerPassword,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelStyle:
                                            TextStyle(color: Colors.white),
                                        labelText: 'Введите Ваш Пароль',
                                      ),
                                    ),
                                  ),
                                  Container(height: 10),
                                  Container(
                                    width: 200,
                                    child: TextField(
                                      controller: _controllerSocialLink,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelStyle:
                                            TextStyle(color: Colors.white),
                                        labelText: 'Ссылка на вас в соц сети',
                                      ),
                                    ),
                                  ),
                                  Container(height: 50),
                                  Container(
                                    width: 200,
                                    height: 50,
                                    color: darkPrimaryColor,
                                    child: InkWell(
                                      child: Flex(
                                        direction: Axis.horizontal,
                                        children: [
                                          Spacer(),
                                          Center(
                                            child: Text(
                                              'КУПИТЬ',
                                              style: TextStyle(
                                                  color: kSecondaryColor,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w900),
                                            ),
                                          ),
                                          Spacer(),
                                        ],
                                      ),
                                      onTap: () {
                                        comercePay.logPassPayment(
                                            comercePay,
                                            _controllerPassword,
                                            _controllerSocialLink);
                                      },
                                    ),
                                  )
                                ]))
                          ],
                        )),
                  ]))
            ]);
          }
        });
  }
}
