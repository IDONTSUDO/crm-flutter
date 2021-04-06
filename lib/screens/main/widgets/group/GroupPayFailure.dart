import 'package:bogdashka/helper/Constants.dart';
import 'package:bogdashka/models/CheckUserGroup.dart';
import 'package:bogdashka/screens/main/widgets/group/common.dart';
import 'package:flutter/material.dart';

class GroupPayFailure extends StatelessWidget {
  List<PayProcess> groups;

  GroupPayFailure(this.groups);
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
            margin: EdgeInsets.all(4),
            child: Flex(direction: Axis.vertical, children: [
              Container(
                margin: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Colors.black87,
                ),
                height: 380,
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
                    // linerLocal(),
                    Container(
                      height: 20,
                    ),
                    Text(
                      'К СОЖАЛЕНИЮ\nПО НОВЫМ ПРАВИЛАМ\nПЛОЩАДКИ ROBLOX\nВЫ ДОЛЖНЫ ПРОБЫТЬ\nВ ГРУППАХ 14 ДНЕЙ\nПО ЭТОМУ МЫ НЕ МОЖЕМ\nВЫПЛАТИТЬ ВАМ РОБУКСЫ\nЕСЛИ ВЫ СЕЙЧАС\nВСТУПИТЕ В ГРУППЫ\nИ ЧЕРЕЗ 14 ДНЕЙ \nМЫ СМОЖЕМ ВАМ ВЫПЛАТИТЬ РОБУКСЫ МЕТОДОМ GROUP',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          textBaseline: TextBaseline.ideographic),
                    ),
                    Container(
                      height: 10,
                    ),
                    // linerLocal(),
                    Container(
                      height: 15,
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
                          // comercePay.setSumRoboxAndBeginPay(availebleBalance);
                        },
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              getGroupHeader(groups),
              for (PayProcess group in groups)
                group.status ? (Container()) : (groupListBuilde(group))
            ]),
            height: 600,
            width: 200)
      ],
    );
  }
}
