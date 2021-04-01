import 'package:flutter/material.dart';
import 'dart:ui';

// ignore: must_be_immutable
class BlurryDialog extends StatelessWidget {
  String title;
  Widget body;
  VoidCallback continueCallBack;

  BlurryDialog(this.body);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: AlertDialog(
          titlePadding: EdgeInsets.zero,
          title: body,
        ));
  }
}
