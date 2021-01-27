import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bogdashka/models/Statictic.dart';
import 'package:intl/intl.dart';

StatisticProvider statisticService = StatisticProvider();

class StatisticProvider {
  Stream<Map<dynamic, dynamic>> get StatisticStream$ => getStatistic();

  Stream<Map<dynamic, dynamic>> getStatistic() {
    final Stream<DocumentSnapshot> stream = FirebaseFirestore.instance
        .collection('Statictics')
        .doc('2021')
        .snapshots();
    return stream.map((element) {
      return element.data();
    });
  }
}
