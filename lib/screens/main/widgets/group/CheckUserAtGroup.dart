import 'package:bogdashka/components/TextLayouth1.dart';
import 'package:bogdashka/components/TextLayouth3.dart';
import 'package:bogdashka/components/TextLayouth4.dart';
import 'package:bogdashka/components/widgets/Liner.dart';
import 'package:bogdashka/controllers/GroupPayment.controller.dart';
import 'package:bogdashka/helper/Constants.dart';
import 'package:bogdashka/models/CheckUserGroup.dart';
import 'package:bogdashka/service/Comerce_service.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../enums.dart';
import '../../../../main.dart';

class CheckUserAtGroup extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 350,
      child: StreamBuilder<UserGroupPay>(
          stream: groupPayment.groupCheck,
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return buildLoadingWidget();
            } else {
              final groupCheck = snapshot.data.group;
              if (groupModeAtUser(groupCheck)) {
                return Container(
                  child: Text('123'),
                );
              } else {
                return Container(
                  height: 600,
                  child: ListView(
                    children: [
                      giveFidbackOnPurshase(
                          groupCheck, snapshot.data.comercePay),
                      Liner(),
                      Center(
                        child: Text(
                          'Список групп куда нужно вступить',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      for (IcheckUserGroup group in groupCheck)
                        group.status ? (Container()) : (UserGroupBuilder(group))
                    ],
                  ),
                );
              }
            }
          }),
    );
  }
}

class UserGroupBuilder extends StatelessWidget {
  IcheckUserGroup checkUserGroup;
  UserGroupBuilder(IcheckUserGroup this.checkUserGroup);
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      child: Flex(direction: Axis.vertical, children: [
        InkWell(
          child: Row(
            children: [
              Spacer(),
              Text(
                'Ссылка на вступление в группу *',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              Spacer(),
            ],
          ),
          onTap: () {
            launch(checkUserGroup.url);
          },
        )
      ]),
      height: 30,
      width: 200,
      decoration: BoxDecoration(
        color: darkPrimaryColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
      ),
    );
  }
}

bool groupModeAtUser(List<IcheckUserGroup> groups) {
  bool statusView = true;
  groups.forEach((element) {
    if (element.status == false) {
      statusView = false;
      return;
    }
  });
  return statusView;
}

Widget giveFidbackOnPurshase(
    List<IcheckUserGroup> groups, ComercePay comercePay) {
  int userAtPay = comercePay.getUserRoboxAtPay();
  double availebleBalance = calculatingTheAvailableBalance(groups);
  if (availebleBalance < userAtPay) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Flex(
          mainAxisAlignment: MainAxisAlignment.center,
          direction: Axis.vertical,
          children: [
            Row(
              children: [
                TextLayouth4('Вы хотите получить $userAtPay'),
                Image(
                  image: new AssetImage(roboxIconLightSrc),
                  height: 50.0,
                  width: 50,
                ),
              ],
            ),
            Row(
              children: [
                TextLayouth4(
                    'Но мы можем вам выплатить только $availebleBalance'),
                Image(
                  image: new AssetImage(roboxIconLightSrc),
                  height: 50.0,
                  width: 50,
                ),
              ],
            ),
            Container(
              width: 140,
              height: 50,
              color: darkPrimaryColor,
              child: InkWell(
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Spacer(),
                    Center(
                      child: Text(
                        'Продолжить',
                        style: TextStyle(color: kSecondaryColor, fontSize: 13),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                onTap: () {
                  comercePay.setSumRoboxAndBeginPay(availebleBalance);
                },
              ),
            )
          ]),
    );
  } else {
    return Flex(direction: Axis.vertical, children: [
      Row(
        children: [
          TextLayouth4('Вы хотите получить $userAtPay'),
          Image(
            image: new AssetImage(roboxIconLightSrc),
            height: 50.0,
            width: 50,
          ),
        ],
      ),
      Container(
        width: 140,
        height: 50,
        color: darkPrimaryColor,
        child: InkWell(
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Spacer(),
              Center(
                child: Text(
                  'Продолжить',
                  style: TextStyle(color: kSecondaryColor, fontSize: 13),
                ),
              ),
              Spacer(),
            ],
          ),
          onTap: () {
            comercePay.setSumRoboxAndBeginPay(availebleBalance);
          },
        ),
      )
    ]);
  }
}

double calculatingTheAvailableBalance(List<IcheckUserGroup> groups) {
  double balance = 0;
  groups.forEach((element) {
    if (element.status) {
      balance += element.balance;
    }
  });
  return balance;
}
