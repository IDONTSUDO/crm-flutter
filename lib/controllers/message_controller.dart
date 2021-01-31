import 'package:bogdashka/models/MessageRooms.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

MessageProvider messageService = MessageProvider();

class MessageProvider {
  Stream<List<MessageRooms>> get messageStream$ => getMessageList();
  Stream<int> get messageCountSteam$ => Stream.fromFuture(getMessageCount());
  Stream<List<MessageRooms>> getMessageList() {
    final Stream<QuerySnapshot> stream = FirebaseFirestore.instance
        .collection('ChatRooms')
        .limit(20)
        .snapshots();
    return stream.map((qShot) => qShot.docs.map((doc) {
          return MessageRooms.fromJson(doc.data());
        }).toList());
  }

  Future<int> getMessageCount() async {
    var counter = 0;

    final Stream<QuerySnapshot> stream = FirebaseFirestore.instance
        .collection('ChatRooms')
        .where('adminMissed' '>' '0')
        .snapshots();

    stream.map((qShot) => qShot.docs.map((fire) {
          var doc = fire.data();
          if (doc['adminMissed'] != null) {
            counter = counter + int.parse(doc['adminMissed']);
          }
        }));
    return counter;
  }
}
