import 'package:bogdashka/screens/main/main_screen.dart';
import 'package:flutter/material.dart';

import 'components/control.dart';

class SettingsScrenn extends StatelessWidget {
  static String path = '/setting';

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 10,
            child: Column(
              children: [Control()],
            ),
          ),
          // SizedBox(width: kDefaultPadding),
          // // Order info and order details
          // Expanded(
          //   flex: 4,
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: const BorderRadius.all(Radius.circular(13)),
          //     ),
          //     child: Column(
          //       children: [
          //         NewOrderInfo(),
          //         // SizedBox(height: kDefaultPadding),
          //         // OrderDetails(),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
