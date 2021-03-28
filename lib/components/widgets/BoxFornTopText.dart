import 'package:flutter/material.dart';

import '../../enums.dart';

class BoxFormTopText extends StatelessWidget {
  TextEditingController formController;
  String text;
  dynamic Function(String) onChangeFn;

  BoxFormTopText(this.formController, this.text, this.onChangeFn);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      child: Column(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Text(
                text,
                style: TextStyle(fontSize: 13),
              )),
          Container(
            margin: const EdgeInsets.only(top: 3.0, bottom: 3.0),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 140,
                    child: TextField(
                      onChanged: (e) => {
                        onChangeFn(e)
                        // comercePay
                        //     .payComputedAtYouPayInput(
                        //         e)
                      },
                      controller: formController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(
                          top: 20, bottom: 20, left: 20, right: 20)),
                ]),
          ),
        ],
      ),
    );
  }
}
