import 'package:bogdashka/helper/Constants.dart';
import 'package:bogdashka/components/AppBarMainScreen.dart';
import 'package:bogdashka/components/BottomNavigationBarMainScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScalfold extends StatelessWidget {
  Widget body;

  MainScalfold(this.body);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgrounDarkTheme,
        appBar: appBarMainScreen(context),
        bottomNavigationBar: getBottomNavigationBarMainScreen(context),
        body: body);
  }
}
