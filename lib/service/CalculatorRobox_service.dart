import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:bogdashka/controllers/notification_controller.dart';
// import 'package:bogdashka/helper/Std.dart';

import 'package:bogdashka/models/CalclutedRobox.dart';

import '../enums.dart';

class CalculatedService {
  double maxRoboxPay;
  ComerceOperation operation;
  double mininalPay;
  double course;
  StreamController<ICalculatedRobox> controllerGroup;
  StreamController<ICalculatedRobox> controllerLogPass;
  StreamController<ICalculatedRobox> controllerTransfer;

  StreamController<ICalculatedRobox> controllerYourPay;

  CalculatedService(this.controllerGroup, this.controllerTransfer,
      this.controllerLogPass, this.controllerYourPay);

  init() {
    controllerYourPay.add(ICalculatedRobox(false, '0'));
    controllerLogPass.add(ICalculatedRobox(false, '0'));
    controllerTransfer.add(ICalculatedRobox(false, '0'));
    controllerGroup.add(ICalculatedRobox(true, '0'));
  }

  selectionType(ComerceOperation operationSelect) {
    if (operationSelect == ComerceOperation.GROUP) {
      controllerYourPay.add(ICalculatedRobox(false, '0'));
      controllerLogPass.add(ICalculatedRobox(false, '0'));
      controllerTransfer.add(ICalculatedRobox(false, '0'));
      controllerGroup.add(ICalculatedRobox(true, '0'));
      return;
    }
    if (operationSelect == ComerceOperation.LOG_PASS) {
      controllerYourPay.add(ICalculatedRobox(false, '0'));
      controllerLogPass.add(ICalculatedRobox(true, '0'));
      controllerTransfer.add(ICalculatedRobox(false, '0'));
      controllerGroup.add(ICalculatedRobox(false, '0'));
      return;
    }
    if (operationSelect == ComerceOperation.TRANSFER) {
      print(200);
      controllerYourPay.add(ICalculatedRobox(false, '0'));
      controllerLogPass.add(ICalculatedRobox(false, '0'));
      controllerTransfer.add(ICalculatedRobox(true, '0'));
      controllerGroup.add(ICalculatedRobox(false, '0'));
      return;
    }
    if (operationSelect == ComerceOperation.YOUR_PAY) {
      controllerYourPay.add(ICalculatedRobox(true, '0'));
      controllerLogPass.add(ICalculatedRobox(false, '0'));
      controllerTransfer.add(ICalculatedRobox(false, '0'));
      controllerGroup.add(ICalculatedRobox(false, '0'));
      return;
    }
  }
}
