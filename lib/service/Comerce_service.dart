import 'package:bogdashka/api/http.dart';
import 'package:bogdashka/controllers/GroupPayment.controller.dart';
import 'package:bogdashka/controllers/api.dart';
import 'package:bogdashka/models/CheckUserGroup.dart';
import 'package:bogdashka/models/GroupPay.dart';
import 'package:bogdashka/models/PayLogPass.dart';
import 'package:flutter/material.dart';
import 'package:bogdashka/controllers/notification_controller.dart';
import 'package:bogdashka/helper/Std.dart';
import 'package:url_launcher/url_launcher.dart';

import '../enums.dart';

class ComercePay {
  double maxRoboxPay;
  ComerceOperation operation;
  double mininalPay;
  TextEditingController yourGetPayTextController;
  TextEditingController yourAtPayTextController;
  TextEditingController loginTextContrleer;
  double course;

  TextEditingController controllerPassword;
  ComercePay(
      this.maxRoboxPay,
      this.operation,
      this.mininalPay,
      this.course,
      this.yourAtPayTextController,
      this.yourGetPayTextController,
      this.loginTextContrleer,
      this.controllerPassword);
  double computedSumAsRobox(double rub) {
    return doubleRounding(rub * course);
  }

  void logPassPayment(
    ComercePay comercePay,
    TextEditingController passwordContoller,
    TextEditingController socialLink,
  ) async {
    if (comercePay.payValid()) {
      if (passwordContoller.text == '') {
        notificationBloc.notification('Поле пароль является обязательным');

        return;
      }
      if (socialLink.text == '') {
        notificationBloc.notification(
            'Вы забыли указать ссылку на свою страницу в соц сетях');
        return;
      }
      if (loginTextContrleer.text == '') {
        notificationBloc.notification('Введите логин');
        return;
      }
      LogPassPayment payment = LogPassPayment(
          userLogin: comercePay.loginTextContrleer.text,
          userPassword: passwordContoller.text,
          amount: comercePay.getUserPay().toString(),
          socialLink: socialLink.text);
      var p = await restProvider.payLogPass(payment);
      if (p != null) {
        launch(p);
      }
    } else {
      return;
    }
  }

  String roboxCourse() {
    final roboxOne = 1 / course;
    return roboxOne.toStringAsFixed(1);
  }

  void payComputedAtYouPayInput(String pay) {
    final payParse = double.tryParse(pay);
    notificationBloc.notification('');
    if (payParse == null) {
      yourGetPayTextController.clear();
      return;
    }
    final int curency = computedRoboxAsSum(payParse);
    if (curency > maxRoboxPay) {
      yourAtPayTextController.clear();
      notificationBloc.notification('Привышает максимальную  сумму робуксов');
      return;
    }
    if (curency < mininalPay) {
      yourAtPayTextController.clear();
      notificationBloc.notification('Привышает минимальную  сумму робуксов');
      return;
    }
    yourAtPayTextController.text = curency.toStringAsFixed(0);
  }

  void payComputedAtYouGetInput(String pay) {
    final payParse = double.tryParse(pay);
    if (payParse == null) {
      yourAtPayTextController.clear();
      return;
    }
    final curency = computedSumAsRobox(payParse);

    if (curency > maxRoboxPay) {
      yourGetPayTextController.clear();
      notificationBloc.notification('Привышает максимальную  сумму робуксов');
      return;
    }
    if (curency < mininalPay) {
      yourGetPayTextController.clear();
      notificationBloc.notification('Привышает минимальную  сумму робуксов');
      return;
    }
    yourGetPayTextController.text = curency.toString();
  }

  int computedRoboxAsSum(double pay) {
    int inc = 0;

    while (pay > 0) {
      inc++;
      pay = pay - course;
    }
    return inc;
  }

  bool payValid() {
    notificationBloc.notification('');
    final String pay = yourGetPayTextController.text;
    final payParse = double.tryParse(pay);
    if (payParse == null) {
      notificationBloc.notification('Не введена сумма для покупки');
      return false;
    }
    final double curency = computedSumAsRobox(payParse);
    if (curency > maxRoboxPay) {
      yourGetPayTextController.clear();
      notificationBloc.notification('Привышает максимальную  сумму робуксов');
      return false;
    }
    if (curency < mininalPay) {
      yourGetPayTextController.clear();
      notificationBloc.notification('Привышает минимальную  сумму робуксов');
      return false;
    }
    return true;
  }

  void groupPayCheckUser(
      TextEditingController controller, ComercePay comercePay) {
    final String nickname = controller.text;
    if (nickname == '') {
      return notificationBloc.notification('Вы забыли ввести никнейм');
    }
    if (comercePay.payValid()) {
      groupPayment.checkUserGroupProcess(nickname, comercePay);
    } else {
      return;
    }
  }

  int getUserRoboxAtPay() {
    final String payStr = yourGetPayTextController.text;
    final payParse = double.tryParse(payStr);

    return computedRoboxAsSum(payParse);
  }

  int getUserPayInt() {
    final String pay = yourAtPayTextController.text;
    return int.tryParse(pay);
  }

  double getUserPay() {
    final String pay = yourAtPayTextController.text;
    return double.tryParse(pay);
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

  void setSumRoboxAndBeginPay(double availebleBalance, List<PayProcess> group) {
    GroupPay payData = GroupPay(
        userLogin: loginTextContrleer.text,
        amount: availebleBalance,
        sessionId: '');
    groupPayment.groupPay(payData);
  }

  void roboxGroupPay() {
    GroupPay payData = GroupPay(
        userLogin: loginTextContrleer.text,
        amount: double.tryParse(yourGetPayTextController.text),
        sessionId: '');
    groupPayment.groupPay(payData);
  }
}
