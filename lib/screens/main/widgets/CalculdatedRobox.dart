import 'package:bogdashka/components/TextLayout1.dart';
import 'package:bogdashka/components/widgets/BoxFornTopText.dart';
import 'package:bogdashka/components/widgets/BoxFromTextLeft.dart';
import 'package:flutter/material.dart';
import 'package:bogdashka/helper/Constants.dart';

// ignore: must_be_immutable
class CalculdatedRobox extends StatelessWidget {
  CalculdatedRobox();
  final TextEditingController _controllerSum = new TextEditingController();
  void eqw(String e) {}
  @override
  Widget build(BuildContext context) {
    _controllerSum.text = '132';

    return Center(
      child: Stack(
        children: [
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Color(0xff7c94b6),
              border: Border.all(
                color: Color(0xff7c94b6),
                width: 8,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Flex(
              direction: Axis.vertical,
              children: [
                TextLayouth1('КАЛЬКУЛЯТОР ПОКУПКИ РОБУКСОВ'),
                TextLayouth1('Введите сумму'),
                BoxFormTopText(_controllerSum, '', eqw),
                Flex(direction: Axis.vertical, children: [
                  BoxFormTextLeft(_controllerSum, '100', eqw, 'Group     = '),
                  BoxFormTextLeft(_controllerSum, '100', eqw, 'Log+Pass  = '),
                  BoxFormTextLeft(_controllerSum, '100', eqw, 'Transfer  = '),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
