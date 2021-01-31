import 'package:bogdashka/controllers/dialog_controller.dart';
import 'package:flutter/material.dart';
import 'package:bogdashka/screens/main/main_screen.dart';

import '../../constants.dart';
import 'component/dialog.dart';
import 'component/dialog.input.dart';
import 'component/message_rounded.dart';

class DialogScreen extends StatefulWidget {
  static String path = '/message';

  @override
  _DialogScreenState createState() => _DialogScreenState();
}

class _DialogScreenState extends State<DialogScreen> {
  @override
  Widget build(BuildContext context) {
    return MainScreen(
      body: Row(
        children: [
          SizedBox(
              height: 750,
              width: 900,
              child: MessageContainer(
                title: dialogService.dialogId,
                children: [DialogList(), DialogInput()],
              ))
        ],
      ),
    );
  }
}
