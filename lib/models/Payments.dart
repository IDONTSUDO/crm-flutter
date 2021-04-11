import 'dart:convert';

Payment paymentFromJson(String str) => Payment.fromJson(json.decode(str));

String paymentToJson(Payment data) => json.encode(data.toJson());

class Payment {
  Payment({
    this.service,
    this.id,
    this.status,
    this.payLogin,
    this.date,
  });

  String service;
  String id;
  String status;
  String payLogin;
  String date;

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        service: json["service"],
        id: json["id"],
        status: json["status"],
        payLogin: json["payLogin"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "service": service,
        "id": id,
        "status": status,
        "payLogin": payLogin,
        "date": date,
      };
}

class PaymentCheck {
  bool status;

  List<Payment> payments;

  PaymentCheck({this.payments, this.status});
}
