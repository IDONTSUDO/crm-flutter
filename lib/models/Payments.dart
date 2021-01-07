import 'dart:convert';

String paymentToJson(Payment data) => json.encode(data.toJson());

class Payment {
  Payment(this.id, this.amount, this.status, this.payLogin, this.date,
      this.service);
  String service;
  String id;
  int amount;
  String status;
  String payLogin;
  String date;
  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "status": status,
        "payLogin": payLogin,
        "date": date,
      };
}
