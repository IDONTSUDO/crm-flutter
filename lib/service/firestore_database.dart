import 'package:bogdashka/interfaces/database.dart';
import 'package:bogdashka/interfaces/document.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'firestore_service.dart';

class FirestoreDatabase extends GetxController implements IDatabase {
  static FirestoreDatabase get to => Get.find<FirestoreDatabase>();
  final _service = FirestoreService.instance;

  @override
  Future<void> insertDocument<T extends IDocument>(String path, T doc) =>
      _service.insert(path: '$path/${doc.id}', data: doc.toJson());

  @override
  Future<void> updateDocument<T extends IDocument>(String path, T doc) =>
      _service.update(path: '$path/${doc.id}', data: doc.toJson());

  @override
  Future<void> deleteDocument<T extends IDocument>(String path, T doc) =>
      _service.delete(path: '$path/${doc.id}');

  @override
  Stream<List<T>> query<T extends IDocument>({
    @required path,
    @required builder,
    @required limit,
    @required filterBy,
    @required sortBy,
    @required connect,
  }) =>
      _service.query(
        path: path,
        builder: builder,
        limit: limit,
        filterBy: filterBy,
        sortBy: sortBy,
        connect: connect,
      );

  @override
  Future<Map<String, dynamic>> get(String path) async {
    final doc = await _service.get(path);
    return doc.exists ? {...doc.data(), 'id': doc.id} : null;
  }

  @override
  Stream<DocumentSnapshot> snapshot(String path) => _service.snapshot(path);

  Future<Map<String, dynamic>> httpsCallable(
          String name, Map<String, dynamic> params) async =>
      _service.httpsCallable(name, params);
}
