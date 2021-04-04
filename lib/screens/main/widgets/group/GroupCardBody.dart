import 'package:bogdashka/controllers/GroupPayment.controller.dart';
import 'package:flutter/material.dart';

import '../../../../enums.dart';
import '../../../../main.dart';
import 'CheckUserAtGroup.dart';
import 'InitGroup.dart';

class GroupCard extends StatelessWidget {
  String text;
  @override
  Widget build(BuildContext context) {
    groupPayment.init();
    return StreamBuilder<GroupPaymentSteps>(
        stream: groupPayment.subject,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return buildLoadingWidget();
          } else {
            if (snapshot.data == GroupPaymentSteps.INIT) {
              return InitGroup();
            }
            if (snapshot.data == GroupPaymentSteps.CHECK_USER_AT_GROUP) {
              return CheckUserAtGroup();
            } else {
              return Text('Not found');
            }
          }
        });
  }
}
