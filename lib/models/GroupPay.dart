import 'dart:convert';

GroupPay groupPayFromJson(String str) => GroupPay.fromJson(json.decode(str));

String groupPayToJson(GroupPay data) => json.encode(data.toJson());

class GroupPay {
  GroupPay(
      {this.userLogin,
      this.amount,
      this.sessionId,
      this.serviceType = 'GROUP',
      this.paySystem = 'QIWI'});

  String userLogin;
  double amount;
  String sessionId;
  String serviceType;
  String paySystem;
  factory GroupPay.fromJson(Map<String, dynamic> json) => GroupPay(
        userLogin: json["userLogin"],
        amount: json["amount"],
        sessionId: json["sessionId"],
        serviceType: json["serviceType"],
      );

  Map<String, dynamic> toJson() => {
        "userLogin": userLogin,
        "amount": amount,
        "sessionId": sessionId,
        "serviceType": serviceType,
        "paySystem": paySystem
      };
}
