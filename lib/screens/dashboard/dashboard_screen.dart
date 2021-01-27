import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bogdashka/controllers/orders_controller.dart';
import 'package:bogdashka/screens/main/main_screen.dart';

import '../../constants.dart';
import 'components/big_body.dart';
import 'components/order_counter.dart';
import 'components/orders_table.dart';
import 'components/status_button.dart';

class DashboardScreen extends StatelessWidget {
  static String path = '/dashboard';
  final OrdersController _ordersController = Get.put(OrdersController());
  @override
  Widget build(BuildContext context) {
    return MainScreen(
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 5,
                child: OrderCounter(),
              ),
              SizedBox(width: kDefaultPadding),
              Expanded(
                flex: 2,
                child: StatusButton(
                  status: "All",
                  press: () {},
                ),
              ),
              SizedBox(width: kDefaultPadding),
              Expanded(
                child: BigButton(
                  press: () {},
                ),
              ),
              SizedBox(width: kDefaultPadding),
              Expanded(
                child: BigButton(
                  press: () {},
                  isIcon: true,
                  color: kGreenColor,
                  svgIcon: "assets/icons/doc.svg",
                ),
              ),
              SizedBox(width: kDefaultPadding),
              Expanded(
                child: BigButton(
                  press: () {},
                  isIcon: true,
                  color: kGreenColor,
                  svgIcon: "assets/icons/add_fill.svg",
                ),
              ),
            ],
          ),
          SizedBox(height: kDefaultPadding),
          OdersTable(),
          SizedBox(height: kDefaultPadding),
          Obx(
            () => FlatButton(
              color: kSecondaryColor,
              disabledColor: Colors.grey,
              onPressed: _ordersController.loadMoreLoading.value
                  ? null
                  : () {
                      _ordersController.loadMore();
                    },
              child: Text(
                "Load More",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}
