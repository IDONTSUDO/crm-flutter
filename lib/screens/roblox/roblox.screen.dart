import 'package:flutter/material.dart';
import 'package:bogdashka/screens/main/main_screen.dart';

import '../../constants.dart';
import 'component/roblox.new.group.dart';
import 'component/robox.group.list.dart';

class RobloxScreen extends StatefulWidget {
  static String path = '/roblox';

  @override
  _RobloxScreenState createState() => _RobloxScreenState();
}

class _RobloxScreenState extends State<RobloxScreen> {
  @override
  Widget build(BuildContext context) {
    return MainScreen(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 300,
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
                        children: [RobloxNewGroup(), RoboxList()],
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
                children: [],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
