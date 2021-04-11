import 'dart:convert';

LogPassPayment logPassPaymentFromJson(String str) =>
    LogPassPayment.fromJson(json.decode(str));

String logPassPaymentToJson(LogPassPayment data) => json.encode(data.toJson());

class LogPassPayment {
  LogPassPayment(
      {this.userLogin,
      this.userPassword,
      this.amount,
      this.serviceType = 'LOG_PASS',
      this.sessionId = '',
      this.socialLink,
      this.paySystem = 'QIWI'});

  String userLogin;
  String userPassword;
  String amount;
  String serviceType;
  String paySystem;
  String sessionId;
  String socialLink;

  factory LogPassPayment.fromJson(Map<String, dynamic> json) => LogPassPayment(
        userLogin: json["userLogin"],
        userPassword: json["userPassword"],
        amount: json["amount"],
        serviceType: json["serviceType"],
        sessionId: json["sessionId"],
        socialLink: json["socialLink"],
      );

  Map<String, dynamic> toJson() => {
        "userLogin": userLogin,
        "userPassword": userPassword,
        "amount": amount,
        "serviceType": serviceType,
        "sessionId": sessionId,
        "socialLink": socialLink,
        "paySystem": paySystem
      };
}
