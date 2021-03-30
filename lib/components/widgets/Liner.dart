import 'package:flutter/material.dart';

import '../../enums.dart';

class Liner extends StatelessWidget {
  Liner();

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Container(
          color: Colors.white,
          width: 900,
          height: 10,
          child: Container(),
        ),
      ],
    );
  }
}
