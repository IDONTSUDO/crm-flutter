import 'package:flutter/material.dart';
import 'package:jetti/constants.dart';

extension FilledText on Text {
  filledText({double padding = 7}) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(6)),
      ),
      child: this,
    );
  }
}
