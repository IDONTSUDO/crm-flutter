import 'package:bogdashka/components/TextLayout1.dart';
import 'package:bogdashka/helper/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ServiceTechJob extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200,
        height: 200,
        color: colorCard,
        child: TextLayouth1('В разработке'));
  }
}
