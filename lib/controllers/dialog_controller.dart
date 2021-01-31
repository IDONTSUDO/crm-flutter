import 'package:bogdashka/models/MessageRooms.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

DialogProvider dialogService = DialogProvider();

class DialogProvider {
  String dialogId = 'idontsudo';

  Stream<MessageRooms> get messageStream$ => getDialog(dialogId);
  void setDialog(String dialogID) {
    dialogService.dialogId = dialogID;
  }

  Stream<MessageRooms> getDialog(String dialogId) {
    final Stream<DocumentSnapshot> stream = FirebaseFirestore.instance
        .collection('ChatRooms')
        .doc(dialogId)
        .snapshots();
    return stream.map((doc) => MessageRooms.fromJson(doc.data()));
  }

  void newMessage(message) {
    FirebaseFirestore.instance
        .collection('ChatRooms')
        .doc(this.dialogId)
        .update({
      "messages": FieldValue.arrayUnion([message])
    });
  }
}
