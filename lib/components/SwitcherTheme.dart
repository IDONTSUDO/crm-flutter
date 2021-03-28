import 'package:bogdashka/components/TextLayouth4.dart';
import 'package:bogdashka/components/widgets/Switcher.dart';
import 'package:bogdashka/controllers/ThemeService.dart';
import 'package:bogdashka/helper/Constants.dart';
import 'package:flutter/material.dart';

class SwitcherTheme extends StatefulWidget {
  @override
  _SwitcherThemeState createState() => _SwitcherThemeState();
}

class _SwitcherThemeState extends State<SwitcherTheme> {
  bool status = false;

// TODO:
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextLayouth4('Выберите режим'),
        Container(
          margin: const EdgeInsets.only(left: 4.0, right: 4.0),
          child: Container(),
        ),
        Center(
          child: CustomSwitch(
            textOff: '  ',
            textOn: '  ',
            width: 70.0,
            activeColor: darkPrimaryColor,
            value: status,
            onChanged: (value) {
              ThemeService().switchTheme();
            },
          ),
        ),
      ],
    );
  }
}
