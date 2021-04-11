import 'package:bogdashka/controllers/PayCheck.dart';
import 'package:bogdashka/models/Payments.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';

class PayList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Payment>>(
        stream: payCheckController.subject.stream,
        builder: (context, snapshot) {
          print(snapshot.data);
          print("PAYMENT");
          if (snapshot.hasData) {
            return buildLoadingWidget();
          } else {
            print(snapshot.data);
            return Row(
              children: [],
            );
          }
        });
  }
}
