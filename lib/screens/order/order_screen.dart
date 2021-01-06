import 'package:flutter/material.dart';
import 'package:jetti/constants.dart';
import 'package:jetti/screens/main/main_screen.dart';
import 'package:jetti/screens/order/components/rounded_container.dart';
import 'components/address_info_card.dart';
import 'components/client_previous_address.dart';
import 'components/contact_info_and_history.dart';
import 'components/delivery_details.dart';
import 'components/new_oder_info.dart';
import 'components/order_details.dart';
import 'components/user_current_address.dart';
import 'components/google_map.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainScreen(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Column(
              children: [
                // Contact Info and History
                ContactInfoAndHistory(),
                SizedBox(height: kDefaultPadding),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 6,
                      // address info and Clients current address
                      child: Column(
                        children: [
                          AddressInfoCard(),
                          UserCurrentAddress(),
                        ],
                      ),
                    ),
                    Container(
                      width: 1.64,
                      color: kBackgroundColor,
                    ),
                    // Delivery details, Clients address and map
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: [
                          DeliveryDetails(),
                          ClientPreviousAddress(),
                          // Google Map
                          RoundedContainer(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(13),
                              bottomLeft: Radius.circular(13),
                            ),
                            title: "Location on Map",
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: AspectRatio(
                                  aspectRatio: 1.11,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(13),
                                    child: GleMap(),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
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
                  SizedBox(height: kDefaultPadding),
                  OrderDetails(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
