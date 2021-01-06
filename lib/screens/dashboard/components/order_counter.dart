import 'package:flutter/material.dart';

import '../../../constants.dart';

class OrderCounter extends StatelessWidget {
  const OrderCounter({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(13),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildCounter(context, title: "New", number: 223),
          buildCounter(context,
              title: "In progress", number: 2342, color: kBlueColor),
          buildCounter(context,
              title: "Delivered", number: 2765, color: kOrangeColor),
          buildCounter(context,
              title: "Ready", number: 1202, color: kDeepBlueColor),
          buildCounter(context,
              title: "On the way", number: 321, color: kYelloColor),
        ],
      ),
    );
  }

  Column buildCounter(
    BuildContext context, {
    @required String title,
    @required int number,
    Color color = kGreenColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$number",
          style: Theme.of(context).textTheme.headline5.copyWith(
                height: 0.9,
                fontWeight: FontWeight.bold,
                color: color,
              ),
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.caption,
        )
      ],
    );
  }
}
