import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:jetti/controllers/orders_controller.dart';

import '../../../constants.dart';

class OdersTable extends StatelessWidget {
  const OdersTable({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<OrdersController>(
      init: OrdersController(),
      builder: (ordersController) {
        // print(ordersController.orderList[0].id);
        return ordersController.isLoading.value
            ? Text("Loading")
            : SizedBox(
                width: double.infinity,
                child: DataTable(
                  columnSpacing: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  dividerThickness: 1.6,
                  columns: [
                    DataColumn(
                      numeric: true,
                      label: Text(
                        'Number',
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Created',
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Customer',
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Status',
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Source',
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Restaurant',
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Delivery time',
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Operator',
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Amount',
                      ),
                    ),
                  ],
                  rows: List.generate(
                    ordersController.orderList.length,
                    (index) => DataRow(
                      cells: <DataCell>[
                        DataCell(
                          Text("_id20398"),
                        ),
                        DataCell(Text(ordersController
                            .orderList[index].createdTime
                            .toString())),
                        DataCell(
                            Text(ordersController.orderList[index].customerId)),
                        DataCell(
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: getStatusColor(ordersController
                                      .orderList[index].statusValue)
                                  .withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              ordersController.orderList[index].statusValue,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: getStatusColor(ordersController
                                      .orderList[index].statusValue),
                                  fontSize: 12),
                            ),
                          ),
                        ),
                        DataCell(
                          Text(ordersController.orderList[index].sourceValue),
                        ),
                        DataCell(
                          Text(ordersController.orderList[index].outletValue),
                        ),
                        DataCell(Text(ordersController
                            .orderList[index].deliveryTime
                            .toString())),
                        DataCell(
                          Text(ordersController.orderList[index].userValue),
                        ),
                        DataCell(
                          Container(
                            constraints: BoxConstraints(minWidth: 100),
                            child: Text(
                              ordersController.orderList[index].amount
                                      .toStringAsFixed(2) +
                                  ' ${ordersController.orderList[index].currency}',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }

  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case "delivering":
        return kDeepBlueColor;
        break;
      case "cooking":
        return Color(0xFF60B158);
        break;
      case "canceled":
        return Colors.redAccent;
        break;
      case "closed":
        return Color(0xFFFFAD11);
        break;
      default:
        return kBlueColor;
    }
  }
}
