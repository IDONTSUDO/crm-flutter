import 'package:bogdashka/helper/Constants.dart';
import 'package:bogdashka/models/CheckUserGroup.dart';
import 'package:flutter/material.dart';

import 'common.dart';

class GroupPayPartial extends StatelessWidget {
  UserGroupPay payProcess;
  GroupPayPartial(this.payProcess);
  Widget build(BuildContext context) {
    final availebleBalance = groupAllBalanceAtUserToPosible(payProcess.group);
    return ListView(children: [
      Container(
          margin: EdgeInsets.all(4),
          child: Flex(direction: Axis.vertical, children: [
            Container(
              margin: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.black87,
              ),
              height: 420,
              width: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 10,
                  ),
                  Text(
                    'ПОКУПКА',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  linerLocal(),
                  Container(
                    height: 20,
                  ),
                  // Spacer(),
                  Text(
                    'ВЫ ХОТИТЕ ПОЛУЧИТЬ',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      payProcess.comercePay.yourAtPayTextController.text,
                      style: TextStyle(color: Colors.white, fontSize: 27),
                    ),
                    Image(
                      image: new AssetImage(roboxIconLightSrc),
                      height: 50.0,
                      width: 50,
                    ),
                  ]),
                  Text(
                    'НО СЕЙЧАС МЫ МОЖЕМ' + '\n' + 'ВАМ ВЫПЛАТИТЬ ТОЛЬКО',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      availebleBalance,
                      style: TextStyle(color: Colors.white, fontSize: 27),
                    ),
                    Image(
                      image: new AssetImage(roboxIconLightSrc),
                      height: 50.0,
                      width: 50,
                    ),
                  ]),
                  linerLocal(),
                  Container(
                    height: 15,
                  ),
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
                              'КУПИТЬ $availebleBalance',
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
                        payProcess.comercePay.setSumRoboxAndBeginPay(
                            double.parse(availebleBalance));
                      },
                    ),
                  ),
                  Container(height: 10),
                  Container(
                    width: 200,
                    height: 50,
                    color: Colors.white,
                    child: InkWell(
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Spacer(),
                          Center(
                            child: Text(
                              ' КУПИТЬ РОБУКСЫ \nДРУГИМ МЕТОДОМ \n',
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
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            getGroupHeader(),
            groupListBuilde(),
            groupListBuilde()
          ]),
          height: 600,
          width: 200)
    ]);
  }
}

Widget getGroupHeader() {
  return Container(
    margin: EdgeInsets.all(3),
    decoration: BoxDecoration(
      color: Colors.black87,
    ),
    height: 60,
    child: Row(
      children: [
        Container(width: 10),
        Text(
          'СПИСОК ГРУПП КУДА' + '\n' + 'НУЖНО ВСТУПИТЬ',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        Spacer(),
      ],
    ),
  );
}

Widget groupListBuilde() {
  return Container(
    margin: EdgeInsets.all(3),
    decoration: BoxDecoration(
      color: Colors.black87,
    ),
    height: 30,
    child: InkWell(
      child: Row(
        children: [
          Spacer(),
          Text(
            'Ссылка на вступление в группу *',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w100),
          ),
          Spacer(),
        ],
      ),
      onTap: () {},
    ),
  );
}

Widget linerLocal() {
  return Container(
      margin: EdgeInsets.all(3), width: 200, height: 2, color: Colors.white);
}
