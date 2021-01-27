import 'package:flutter/material.dart';
import 'package:bogdashka/components/header.dart';
import 'package:bogdashka/components/side_menu.dart';

import '../../constants.dart';

class MainScreen extends StatelessWidget {
  final Widget body;
  static String path = '/main';
  const MainScreen({Key key, @required this.body}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: BoxConstraints(minWidth: kMaxWidth),
          padding: const EdgeInsets.fromLTRB(
            kDefaultPadding,
            kDefaultPadding,
            kDefaultPadding,
            0,
          ),
          width: kMaxWidth,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SideMenu(),
              SizedBox(width: kDefaultPadding),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Header(),
                      SizedBox(height: kDefaultPadding),
                      body,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
