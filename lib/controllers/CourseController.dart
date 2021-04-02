import 'package:bogdashka/models/Settings.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class Bloc {
  Stream<List<ISettings>> get subject => getSettigs();
  Stream<List<ISettings>> getSettigs() {
    final Stream<QuerySnapshot> stream =
        FirebaseFirestore.instance.collection('Settings').snapshots();
    return stream.map((qShot) => qShot.docs.map((doc) {
          var fire = doc.data();
          return ISettings.fromJson(fire, doc.id);
        }).toList());
  }
}

final iSettingsBlock = Bloc();
