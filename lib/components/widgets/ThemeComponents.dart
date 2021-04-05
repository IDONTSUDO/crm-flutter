import 'package:bogdashka/service/ThemeService.dart';
import 'package:flutter/material.dart';

class ThemeComponent extends StatelessWidget {
  final Widget darkWidget;
  final Widget lightWidger;

  ThemeComponent(this.darkWidget, this.lightWidger);
  @override
  Widget build(BuildContext context) {
    final themeMode = ThemeService().theme;
    // ignore: unused_local_variable
    Widget widgetBody;
    false ? (widgetBody = darkWidget) : (widgetBody = lightWidger);
    return widgetBody;
  }
}
