import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'document.dart';

abstract class IDatabase {
  Future<Map<String, dynamic>> get(String path);
  Stream<DocumentSnapshot> snapshot(String path);

  Stream<List<T>> query<T extends IDocument>({
    @required Stream<bool> connect,
    @required String path,
    @required T Function(Map<String, dynamic> data) builder,
    @required Stream<int> limit,
    @required Stream<List<Filter>> filterBy,
    @required Stream<List<Sort>> sortBy,
  });

  Future<void> insertDocument<T extends IDocument>(String path, T doc);
  Future<void> updateDocument<T extends IDocument>(String path, T doc);
  Future<void> deleteDocument<T extends IDocument>(String path, T doc);
  Future<Map<String, dynamic>> httpsCallable(
      String name, Map<String, dynamic> params);
}
