import 'package:bogdashka/models/Settings.dart';
import 'package:bogdashka/service/firestore_database.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class Controller extends FirestoreDatabase {
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

final settingsController = Controller();
