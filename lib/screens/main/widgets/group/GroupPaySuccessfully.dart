import 'package:bogdashka/helper/Constants.dart';
import 'package:bogdashka/models/CheckUserGroup.dart';
import 'package:bogdashka/service/Comerce_service.dart';
import 'package:flutter/material.dart';

import 'common.dart';

// ignore: must_be_immutable
class GroupPaySuccessfully extends StatelessWidget {
  UserGroupPay payProcess;
  GroupPaySuccessfully(this.payProcess);
  Widget build(BuildContext context) {
    List<PayProcess> groups = payProcess.group;
    return ListView(children: [
      Container(
          margin: EdgeInsets.all(4),
          child: Flex(direction: Axis.vertical, children: [
            Container(
              margin: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.black87,
              ),
              height: 240,
              width: 400,
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
                    height: 40,
                  ),
                  Spacer(),
                  Text(
                    'Вы покупайте',
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
                  linerLocal(),
                  Container(
                    height: 15,
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
                        payProcess.comercePay.roboxGroupPay();
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
    ]);
  }
}
