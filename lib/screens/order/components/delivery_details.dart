import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'rounded_container.dart';

class DeliveryDetails extends StatelessWidget {
  const DeliveryDetails({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: RoundedContainer(
        title: "Delivery Details",
        borderRadius: const BorderRadius.only(topRight: Radius.circular(13)),
        children: [
          buildDetails(
            context,
            leftData: "11:00-23:00",
            leftTitle: "Delivery hours",
            rightData: "13:34",
            rightTitle: "Current time",
          ),
          Spacer(),
          buildDetails(
            context,
            leftData: "30 min",
            leftTitle: "Takeway time",
            rightData: "45 min",
            rightTitle: "Delivery time",
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }

  Padding buildDetails(
    BuildContext context, {
    @required String leftData,
    @required String rightData,
    @required String leftTitle,
    @required String rightTitle,
  }) {
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
          )
        ],
      ),
    );
  }
}
