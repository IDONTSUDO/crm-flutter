import 'package:bogdashka/models/Payments.dart';
import 'package:bogdashka/service/firestore_database.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

class Controller extends FirestoreDatabase {
  BehaviorSubject<List<Payment>> get subject =>
      BehaviorSubject<List<Payment>>();
  void getCheckUser(String nickName) {
    List<Payment> payments = [];
    final Stream<QuerySnapshot> stream = FirebaseFirestore.instance
        .collection('Payments')
        .where('payLogin', isEqualTo: nickName)
        .snapshots();
    stream.forEach((element) {
      element.docs.forEach((fire) {
        var f = fire.data();
        var p = Payment.fromJson(f);
        payments.add(p);
        subject.add(payments);
      });
    });
  }
}

final payCheckController = Controller();
