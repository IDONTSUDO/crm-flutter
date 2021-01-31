import 'package:bogdashka/controllers/dialog_controller.dart';
import 'package:bogdashka/models/MessageRooms.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DialogInput extends StatelessWidget {
  const DialogInput({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: _buildTextField());
  }
}

Widget _buildTextField() {
  final maxLines = 5;
  var msg = '';
  var focusNode = FocusNode(onKey: (node, event) {
    if (event.isKeyPressed(LogicalKeyboardKey.enter)) {
      if (msg != '') {
        dialogService.newMessage({
          'user': 'Text',
          'message': msg,
          'isAdmin': true,
          'date': new DateTime.now().toString(),
          'read': false
        });
      }
    }
  });
  return Container(
    margin: EdgeInsets.all(12),
    height: maxLines * 24.0,
    child: TextField(
      focusNode: focusNode,
      onChanged: (e) => {msg = e},
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: "Enter a message",
        fillColor: Colors.grey[300],
        filled: true,
        suffixIcon: IconButton(
          onPressed: () => {
            if (msg != '')
              {
                dialogService.newMessage({
                  'user': 'Text',
                  'message': msg,
                  'isAdmin': true,
                  'date': new DateTime.now().toString(),
                  'read': false
                })
              }
          },
          icon: Icon(Icons.message),
        ),
      ),
    ),
  );
}
