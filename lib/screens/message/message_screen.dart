import 'package:flutter/material.dart';
import 'package:bogdashka/screens/main/main_screen.dart';

import '../../constants.dart';

class MessageScreen extends StatefulWidget {
  static String path = '/messages';

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return MainScreen(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 10,
            child: Column(
              children: [
                SizedBox(height: kDefaultPadding),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 6,
                      // address info and Clients current address
                      child: Column(
                        children: [
                          // AddressInfoCard(),
                          // UserCurrentAddress(),
                        ],
                      ),
                    ),
                    Container(
                      width: 1.64,
                      color: kBackgroundColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: kDefaultPadding),
          // Order info and order details
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(13)),
              ),
              child: Column(
                children: [
                  // SizedBox(height: kDefaultPadding),
                  // OrderDetails(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
