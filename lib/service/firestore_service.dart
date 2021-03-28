import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../interfaces/document.dart';

class FirestoreService {
  FirestoreService._();

  static final instance = FirestoreService._();

  static final FirebaseFunctions functions =
      FirebaseFunctions.instanceFor(region: 'europe-west1');

  Future<Map<String, dynamic>> httpsCallable(
      String name, Map<String, dynamic> params) async {
    HttpsCallable callable = functions.httpsCallable(name);
    final HttpsCallableResult<dynamic> response = await callable.call(params);
    return response.data;
  }

  Future<DocumentSnapshot> get(String path) async {
    final ref = FirebaseFirestore.instance.doc(path);
    return await ref.get();
  }

  Stream<DocumentSnapshot> snapshot(String path) {
    final ref = FirebaseFirestore.instance.doc(path);
    return ref.snapshots();
  }

  Stream<T> document<T extends IDocument>(
    String path,
    T Function(Map<String, dynamic> data) builder,
  ) {
    final ref = FirebaseFirestore.instance.doc(path);
    return ref
        .snapshots()
        .map((snap) => builder({...snap.data(), "id": snap.id}));
  }

  Future<void> insert({String path, Map<String, dynamic> data}) async {
    final ref = FirebaseFirestore.instance.doc(path);
    await ref.set(data);
  }

  Future<void> update({String path, Map<String, dynamic> data}) async {
    final ref = FirebaseFirestore.instance.doc(path);
    await ref.update(data);
  }

  Future<void> delete({String path, String id}) async {
    final ref = FirebaseFirestore.instance.doc(path);
    await ref.delete();
  }

  Stream<List<T>> query<T extends IDocument>({
    @required String path,
    @required T Function(Map<String, dynamic> data) builder,
    @required Stream<int> limit,
    @required Stream<List<Filter>> filterBy,
    @required Stream<List<Sort>> sortBy,
    @required Stream<bool> connect,
  }) {
    T _createDoc(DocumentChange docChange) =>
        builder({...docChange.doc.data(), "id": docChange.doc.id});

    List<T> _newState(List<T> state, List<DocumentChange> changes) {
      print(
          "${path.toString()}: state=${state.length}, changes=${changes.length}");
      changes.forEach((docChange) {
        print(docChange.type.toString());
        final doc = _createDoc(docChange);
        switch (docChange.type) {
          case DocumentChangeType.added:
            state.insert(docChange.newIndex, doc);
            break;
          case DocumentChangeType.modified:
            state[docChange.oldIndex] = doc;
            break;
          case DocumentChangeType.removed:
            state.removeAt(docChange.oldIndex);
            break;
        }
      });
      return [...state];
    }

    return CombineLatestStream([
      limit,
      filterBy,
      sortBy,
      connect,
    ], (params) {
      print(params);
      return params;
    }).where((params) => params[3]).switchMap((params) {
      final state = List<T>.from([]);
      return queryBuilder(
        path: path,
        limit: params[0],
        filters: params[1],
        sorts: params[2],
      )
          .snapshots()
          .map((querySnaphot) => querySnaphot.docChanges)
          .map((docChanges) => _newState(state, docChanges));
    });
  }

  Query queryBuilder({
    String path,
    int limit = 10,
    List<Filter> filters,
    List<Sort> sorts,
  }) {
    Query query = FirebaseFirestore.instance.collection(path).limit(limit);

    filters.forEach((filter) {
      switch (filter.compareOperator) {
        // TO-DO Add all CompareOperator
        case CompareOperator.isEqualTo:
          query = query.where(filter.key, isEqualTo: filter.value);
          break;
        case CompareOperator.isNull:
          query = query.where(filter.key, isNull: true);
          break;
        case CompareOperator.isGreaterThan:
          query = query.where(filter.key, isGreaterThan: filter.value);
          break;
        default:
          break;
      }
    });

    sorts.forEach((order) => query = query.orderBy(
          order.key,
          descending: order.descending,
        ));

    return query;
  }
}
