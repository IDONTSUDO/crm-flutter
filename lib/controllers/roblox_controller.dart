import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bogdashka/models/Robox.dart';

RoboxProvider roboxService = RoboxProvider();

class RoboxProvider {
  Stream<List<Robox>> get RoboxStream$ => getRobox();
  void newRobox(Map<dynamic, dynamic> model) {
    var newModel = {
      'status': true,
      'balance': int.tryParse(model['balance']),
      'cookies': model['cookies'],
      'groupId': model['groupId'],
      'id': model['id']
    };
    FirebaseFirestore.instance
        .collection('Groups')
        .doc(newModel['id'])
        .set(newModel);
  }

  void deleteRobox(String id) {
    FirebaseFirestore.instance.collection('Groups').doc(id).delete();
  }

  Stream<List<Robox>> getRobox() {
    final Stream<QuerySnapshot> stream =
        FirebaseFirestore.instance.collection('Groups').snapshots();

    return stream.map((qShot) => qShot.docs.map((doc) {
          var fire = doc.data();
          return Robox(fire['balance'], fire['cookies'], fire['groupId'],
              fire['id'], fire['status']);
        }).toList());
  }
}
