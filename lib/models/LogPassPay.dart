import 'dart:convert';

import 'package:bogdashka/enums.dart';
import 'dart:convert';

IPayLogPass iPayLogPassFromJson(String str) =>
    IPayLogPass.fromJson(json.decode(str));

String iPayLogPassToJson(IPayLogPass data) => json.encode(data.toJson());

class IPayLogPass {
  IPayLogPass({
    this.serviceType,
    this.amount,
    this.userLogin,
    this.status,
    this.payType,
    this.sessionId,
    this.password,
  });

  ComerceOperation serviceType;
  double amount;
  String userLogin;
  String status;
  PayType payType;
  String sessionId;
  String password;

  factory IPayLogPass.fromJson(Map<String, dynamic> json) => IPayLogPass(
        serviceType: json["serviceType"],
        amount: json["amount"].toDouble(),
        userLogin: json["userLogin"],
        status: json["status"],
        payType: json["payType"],
        sessionId: json["sessionId"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "serviceType": serviceType,
        "amount": amount,
        "userLogin": userLogin,
        "status": status,
        "payType": payType,
        "sessionId": sessionId,
        "password": password,
      };
}
