import 'package:bogdashka/screens/message/component/message.list.dart';
import 'package:flutter/material.dart';
import 'package:bogdashka/screens/main/main_screen.dart';

import '../../constants.dart';

class MessageScreen extends StatefulWidget {
  static String path = '/messages';

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return MainScreen(
      body: Row(
        children: [
          MessageList(),
        ],
      ),
    );
  }
}
