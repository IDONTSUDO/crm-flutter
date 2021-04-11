import 'package:flutter/material.dart';

class TextLayouth3 extends StatelessWidget {
  String text;

  TextLayouth3(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
