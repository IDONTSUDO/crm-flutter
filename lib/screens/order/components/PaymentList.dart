import 'package:flutter/material.dart';
import 'package:bogdashka/controllers/Payment_controller.dart';
import 'package:bogdashka/models/Payments.dart';
import 'package:bogdashka/screens/order/components/rounded_container.dart';

import '../../../constants.dart';
import '../../../main.dart';

class PaymentList extends StatefulWidget {
  PaymentList({Key key}) : super(key: key);

  @override
  _PaymentListState createState() => _PaymentListState();
}

class _PaymentListState extends State<PaymentList> {
  @override
  // ignore: must_call_super

  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: paymentService.getPayment(),
      builder: (context, AsyncSnapshot<List<Payment>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.length == 0) {
            return Text('Не добавлено ни одной точки');
          } else {
            return SizedBox(
                height: 750,
                width: 900,
                child: RoundedContainer(
                  title: "Payments Details",
                  children: [
                    SizedBox(
                        height: 700,
                        child: ListView.separated(
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(),
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return buildDetails(context,
                                  leftData: snapshot.data[index].date,
                                  leftTitle: 'Final amount:' +
                                      snapshot.data[index].amount.toString(),
                                  rightData: snapshot.data[index].status,
                                  rightTitle: snapshot.data[index].payLogin,
                                  right: snapshot.data[index].service);
                            }))
                  ],
                ));
          }
        } else {
          return buildLoadingWidget();
        }
      },
    );
  }

  Padding buildDetails(BuildContext context,
      {@required String leftData,
      @required String rightData,
      @required String leftTitle,
      @required String rightTitle,
      @required String right}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.75),
      child: Row(
        children: [
          Expanded(
            child: Text.rich(
              TextSpan(
                text: "$leftData\n",
                children: [
                  TextSpan(
                    text: leftTitle,
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(color: kSecondaryColor),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Text.rich(
              TextSpan(
                text: "$rightData\n",
                children: [
                  TextSpan(
                    text: rightTitle,
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(color: kSecondaryColor),
                  ),
                ],
              ),
            ),
          ),
          Text.rich(
            TextSpan(
              text: "$right\n",
            ),
          ),
        ],
      ),
    );
  }
}
