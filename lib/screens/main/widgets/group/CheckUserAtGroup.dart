import 'package:bogdashka/components/TextLayouth4.dart';
import 'package:bogdashka/controllers/GroupPayment.controller.dart';
import 'package:bogdashka/helper/Constants.dart';
import 'package:bogdashka/models/CheckUserGroup.dart';
import 'package:bogdashka/screens/main/widgets/group/GroupPaySuccessfully.dart';
import 'package:bogdashka/service/Comerce_service.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../main.dart';
import 'GroupPayFailure.dart';
import 'GroupPayPartial.dart';
import 'common.dart';

class CheckUserAtGroup extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      height: 470,
      width: 350,
      child: StreamBuilder<UserGroupPay>(
          stream: groupPayment.groupCheck,
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return buildLoadingWidget();
            } else {
              // TODO: ЭТО НУЖНО РЕФАКТОРИТЬ
              return groupPayStep(snapshot.data, context);
            }
          }),
    );
  }
}

Widget groupPayStep(UserGroupPay payProcess, BuildContext context) {
  final List<PayProcess> group = payProcess.group;
  int payRobox = payProcess.comercePay.getUserPayInt();
  int userAvaliebelRobox =
      int.parse(groupAllBalanceAtUserToPosible(payProcess.group));

  if (isGroupPayPartial(payProcess.group)) {
    return GroupPayFailure(group);
  }
  if (userAvaliebelRobox - payRobox > 0) {
    return GroupPaySuccessfully(payProcess);
  } else {
    return GroupPayPartial(payProcess);
  }
  return Text('Error');
}

bool isGroupPayPartial(List<PayProcess> listGroup) {
  bool status = true;
  listGroup.forEach((element) {
    if (element.status) {
      status = false;
    }
  });
  return status;
}

class UserGroupBuilder extends StatelessWidget {
  PayProcess checkUserGroup;
  UserGroupBuilder(PayProcess this.checkUserGroup);
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

bool groupModeAtUser(List<PayProcess> groups) {
  bool statusView = true;
  groups.forEach((element) {
    if (element.status == false) {
      statusView = false;
      return;
    }
  });
  return statusView;
}

Widget giveFidbackOnPurshase(List<PayProcess> groups, ComercePay comercePay) {
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

double calculatingTheAvailableBalance(List<PayProcess> groups) {
  double balance = 0;
  groups.forEach((element) {
    if (element.status) {
      balance += element.balance;
    }
  });
  return balance;
}
