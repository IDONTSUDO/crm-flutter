import 'dart:async';

import 'package:bogdashka/api/http.dart';
import 'package:bogdashka/controllers/Settings.controller.dart';
import 'package:bogdashka/models/CheckUserGroup.dart';
import 'package:bogdashka/models/GroupPay.dart';
import 'package:bogdashka/service/Comerce_service.dart';
import 'package:rxdart/rxdart.dart';
import 'package:url_launcher/url_launcher.dart';

import '../enums.dart';

class GroupPayment {
  final BehaviorSubject<GroupPaymentSteps> _subject =
      BehaviorSubject<GroupPaymentSteps>();
  final BehaviorSubject<UserGroupPay> _groupCheck =
      BehaviorSubject<UserGroupPay>();
  BehaviorSubject<GroupPaymentSteps> get subject => _subject;
  BehaviorSubject<UserGroupPay> get groupCheck => _groupCheck;

  pay() {
    _subject.add(GroupPaymentSteps.FINAL);
  }

  init() {
    _subject.add(GroupPaymentSteps.INIT);
  }

  checkUserGroupProcess(String nickName, ComercePay comercePay) async {
    _subject.add(GroupPaymentSteps.CHECK_USER_AT_GROUP);
    var listGroup = await restProvider.checkUserAtGroup(nickName);
    if (listGroup != null) {
      final List<PayProcess> groups = [];
      listGroup.forEach((element) {
        var userGroup = PayProcess.fromJson(element);
        groups.add(userGroup);
      });
      _groupCheck.add(UserGroupPay(group: groups, comercePay: comercePay));
    } else {}
  }

  void groupPay(GroupPay payData) async {
    var link = await restProvider.getPayGroup(payData);
    if (link != null) {
      if (Uri.parse(link).isAbsolute) {
        launch(link);
      }
    }
  }
}

final groupPayment = new GroupPayment();
