import 'package:bogdashka/components/MainScalford.dart';
import 'package:bogdashka/helper/Constants.dart';
import 'package:bogdashka/screens/payCheck/widgets/PayList.dart';
import 'package:flutter/material.dart';

import 'widgets/PayCheckInput.dart';

class PayCheck extends StatelessWidget {
  static String path = '/pay/check';
  @override
  Widget build(BuildContext context) {
    return MainScalfold(Stack(children: [
      Container(
        height: getHeighStep(context),
        child: Flex(
          direction: Axis.vertical,
          children: [
            Container(
              height: 40,
            ),
            PayCheckInput(),
            PayList()
          ],
        ),
      )
    ]));
  }
}
