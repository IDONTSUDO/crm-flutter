import 'dart:convert';

import 'package:bogdashka/service/Comerce.dart';

List<IcheckUserGroup> icheckUserGroupFromJson(String str) =>
    List<IcheckUserGroup>.from(
        json.decode(str).map((x) => IcheckUserGroup.fromJson(x)));

String icheckUserGroupToJson(List<IcheckUserGroup> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class IcheckUserGroup {
  IcheckUserGroup({
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

  factory IcheckUserGroup.fromJson(Map<String, dynamic> json) =>
      IcheckUserGroup(
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
  List<IcheckUserGroup> group;
  ComercePay comercePay;
  UserGroupPay({this.group, this.comercePay});
}
