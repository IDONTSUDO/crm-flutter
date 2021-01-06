import 'package:cloud_firestore/cloud_firestore.dart';

class Api {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String path;
  CollectionReference ref;

  Api(this.path) {
    ref = _db.collection(path);
  }

  CollectionReference getRef() {
    return ref;
  }

  Future<QuerySnapshot> getDataCollection() {
    return ref.get();
  }

  Future<QuerySnapshot> getLimitedDataCollection(int limit) {
    return ref.limit(limit).get();
  }

  Stream<QuerySnapshot> streamDataCollection({int limit = 100}) {
    return ref.limit(limit).snapshots();
  }

  Future<DocumentSnapshot> getDocumentById(String id) {
    return ref.doc(id).get();
  }

  Future<void> removeDocument(String id) {
    return ref.doc(id).delete();
  }

  Future<DocumentReference> addDocument(Map data) {
    return ref.add(data);
  }

  Future<void> updateDocument(Map data, String id) {
    return ref.doc(id).update(data);
  }
}
