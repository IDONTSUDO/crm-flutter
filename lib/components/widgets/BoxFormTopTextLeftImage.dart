import 'package:flutter/material.dart';

import '../../enums.dart';

class BoxFormTopTextLeftImage extends StatelessWidget {
  TextEditingController formController;
  String text;
  String imgpath;
  dynamic Function(String) onChangeFn;

  BoxFormTopTextLeftImage(
      this.formController, this.imgpath, this.text, this.onChangeFn);

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
                  ),
                  Container(
                      margin: const EdgeInsets.only(
                          top: 5.0, bottom: 5.0, left: 5, right: 5)),
                  Image(
                    image: new AssetImage(imgpath),
                    height: 30.0,
                    width: 30,
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
