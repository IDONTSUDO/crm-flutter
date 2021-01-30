import 'package:bogdashka/models/MessageRooms.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

MessageProvider messageService = MessageProvider();

class MessageProvider {
  Stream<List<MessageRooms>> get messageStream$ => getMessageList();

  Stream<List<MessageRooms>> getMessageList() {
    final Stream<QuerySnapshot> stream = FirebaseFirestore.instance
        .collection('ChatRooms')
        // .orderBy('created', descending: true)
        .limit(20)
        .snapshots();
    return stream.map((qShot) => qShot.docs.map((doc) {
          return MessageRooms.fromJson(doc.data());
        }).toList());
  }
}
