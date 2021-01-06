import 'package:flutter/material.dart';

import '../constants.dart';

class Order {
  final String id,
      uuid,
      currency,
      customerId,
      customerValue,
      outletId,
      outletValue,
      sourceValue,
      statusValue,
      userId,
      userValue;
  final int statusId, sourceId;
  final double amount;

  final DateTime deliveryTime, createdTime;

  Order(
    this.id,
    this.uuid,
    this.currency,
    this.customerId,
    this.customerValue,
    this.outletId,
    this.outletValue,
    this.sourceValue,
    this.statusValue,
    this.userId,
    this.userValue,
    this.statusId,
    this.sourceId,
    this.amount,
    this.deliveryTime,
    this.createdTime,
  );

  Order.fromMap(Map<String, dynamic> snapshot, String uuid)
      : id = snapshot['id'],
        uuid = snapshot['uuid'],
        currency = snapshot['currency'],
        amount = snapshot['amount'] == "" ? 0 : snapshot['amount'],
        customerId = snapshot['customer']['id'],
        customerValue = snapshot['customer']['value'],
        outletId = snapshot['outlet']['id'],
        outletValue = snapshot['outlet']['value'],
        sourceId = snapshot['source']['id'],
        sourceValue = snapshot['source']['value'],
        statusId = snapshot['status']['id'],
        statusValue = snapshot['status']['value'],
        userValue = snapshot['user']['value'],
        userId = snapshot['user']['id'],
        deliveryTime = DateTime.parse(snapshot['deliveryTime']),
        createdTime = DateTime.parse(snapshot['created']);

  // : uuId = uuid,
  //   fullName = snapshot['name']['fullName'] ?? "",
  //   shortName = snapshot['name']['shortName'] ?? "",
  //   imageURL = snapshot['imageURL'] ?? "",
  //   composition = snapshot['description']['composition'] ?? "",
  //   calories = snapshot['description']['calorie'],
  //   carbohydrates = snapshot['description']['carbohydrates'],
  //   fat = snapshot['description']['fat'],
  //   proteins = snapshot['description']['proteins'],
  //   weight = snapshot['description']['weight'],
  //   cookingTime = snapshot['description']['cookingTime'];
}
