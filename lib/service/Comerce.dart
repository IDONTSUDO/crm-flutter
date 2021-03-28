import 'package:bogdashka/controllers/notificationBloc.dart';
import 'package:bogdashka/helper/Std.io.dart';

import '../enums.dart';
import 'package:flutter/material.dart';

class ComercePay {
  double maxRoboxPay;
  ComerceOperation operation;
  double mininalPay;
  TextEditingController yourGetPayTextController;
  TextEditingController yourAtPayTextController;
  double course;
  ComercePay(this.maxRoboxPay, this.operation, this.mininalPay, this.course,
      this.yourAtPayTextController, this.yourGetPayTextController);
  computedSumAsRobox(double rub) {
    double computed = rub * course;
    return doubleRounding(computed);
  }

  roboxCourse() {
    final roboxOne = 1 / course;
    return roboxOne.toStringAsFixed(1);
  }

  // ВЫ ПЛАТИТЕ
  payComputedAtYouPayInput(String pay) {
    final payParse = double.tryParse(pay);
    notificationBloc.notification('');
    if (payParse == null) {
      yourGetPayTextController.clear();
      return;
    }
    final curency = computedSumAsRobox(payParse);
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
    yourAtPayTextController.text = curency.toString();
  }

  //RELISED
  payComputedAtYouGetInput(String pay) {
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

  payClick() {}
}
