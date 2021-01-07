import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jetti/models/Payments.dart';
import 'package:intl/intl.dart';

PaymentProvider paymentService = PaymentProvider();

class PaymentProvider {
  Stream<List<Payment>> get paymentStream$ => getPayment();

  Stream<List<Payment>> getPayment() {
    final Stream<QuerySnapshot> stream = FirebaseFirestore.instance
        .collection('Payments')
        .orderBy('date', descending: true)
        .limit(10)
        .snapshots();
    return stream.map((qShot) => qShot.docs.map((doc) {
          var fire = doc.data();
          String time =
              DateFormat('kk:mm:a').format(DateTime.parse(fire['date']));

          return Payment(fire['id'], fire['amount'], fire['status'],
              fire['payLogin'], time, fire['service']);
        }).toList());
  }
}
