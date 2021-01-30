import 'package:bogdashka/screens/message/component/message.list.dart';
import 'package:flutter/material.dart';
import 'package:bogdashka/screens/main/main_screen.dart';

import '../../constants.dart';

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
           
        ],
      ),
    );
  }
}
