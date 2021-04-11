import 'package:bogdashka/components/TextLayout1.dart';
import 'package:flutter/material.dart';

import '../../enums.dart';

class BoxFormTextLeft extends StatelessWidget {
  TextEditingController formController;
  String text;
  String textLeft;
  dynamic Function(String) onChangeFn;

  String initValue;

  BoxFormTextLeft(
      this.formController, this.text, this.onChangeFn, this.textLeft,
      {this.initValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin: const EdgeInsets.only(
                          top: 5.0, bottom: 5.0, left: 5, right: 5)),
                  TextLayouth1(textLeft),
                  Spacer(),
                  Container(
                    height: 50,
                    width: 140,
                    child: TextField(
                      style: new TextStyle(
                        fontSize: 16,
                      ),
                      onChanged: (e) => {onChangeFn(e)},
                      controller: formController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
