import 'package:flutter/material.dart';
import 'package:bogdashka/constants.dart';
import 'package:bogdashka/screens/main/main_screen.dart';
import 'components/PaymentList.dart';
import 'components/new_oder_info.dart';

class OrderScreen extends StatelessWidget {
  static String path = '/orders';
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
                PaymentList(),
                ButtonBar(
                  mainAxisSize: MainAxisSize
                      .min, // this will take space as minimum as posible(to center)
                  children: <Widget>[
                    new RaisedButton(
                      child: new Text('Here',
                          style: TextStyle(color: Colors.black)),
                      onPressed: null,
                    ),
                    new RaisedButton(
                      child: new Text('There',
                          style: TextStyle(color: Colors.black)),
                      onPressed: null,
                    ),
                  ],
                ),
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
                  NewOrderInfo(),
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
