import 'dart:convert';

import 'package:bogdashka/service/Comerce_service.dart';

List<PayProcess> PayProcessFromJson(String str) =>
    List<PayProcess>.from(json.decode(str).map((x) => PayProcess.fromJson(x)));

String PayProcessToJson(List<PayProcess> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PayProcess {
  PayProcess({
    this.id,
    this.roboxId,
    this.status,
    this.url,
    this.balance,
  });

  String id;
  String roboxId;
  bool status;
  String url;
  int balance;

  factory PayProcess.fromJson(Map<String, dynamic> json) => PayProcess(
        id: json["id"],
        roboxId: json["roboxId"],
        status: json["status"],
        url: json["url"],
        balance: json["balance"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "roboxId": roboxId,
        "status": status,
        "url": url,
        "balance": balance,
      };
}

class UserGroupPay {
  List<PayProcess> group;
  ComercePay comercePay;
  UserGroupPay({this.group, this.comercePay});
}
