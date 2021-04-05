import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  Display({Key key, this.value, this.height}) : super(key: key);

  final String value;
  final double height;

  String get _output => value.toString();
  double get _margin => (height / 10);

  final LinearGradient _gradient =
      const LinearGradient(colors: [Colors.black26, Colors.black45]);

  @override
  Widget build(BuildContext context) {
    TextStyle style = Theme.of(context)
        .textTheme
        .headline3
        .copyWith(color: Colors.white, fontWeight: FontWeight.w200);

    return Container(
        width: 250,
        color: Colors.white,
        height: 100,
        child: Container(
            height: 100,
            decoration: BoxDecoration(gradient: _gradient),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _output,
                    style: style,
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    softWrap: false,
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            )));
  }
}
