import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../constants.dart';
import 'rounded_container.dart';

class ClientPreviousAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      title: "Client address",
      borderRadius: BorderRadius.zero,
      children: [
        buildAddress(address: "345/35 Mira st, 133", isValidAddress: true),
        SizedBox(height: kDefaultPadding * 0.75),
        buildAddress(address: "20 Mayskaya st, 53", isValidAddress: false),
        SizedBox(height: kDefaultPadding * 1.5),
      ],
    );
  }

  Padding buildAddress({
    @required String address,
    @required bool isValidAddress,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding * 0.75,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              address,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(width: kDefaultPadding / 2),
          FlatButton(
            minWidth: 60,
            color: isValidAddress ? kGreenColor : kRedColor,
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            onPressed: () {},
            child: Text(
              isValidAddress ? "Ok" : "?",
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(width: kDefaultPadding / 4),
          FlatButton(
            minWidth: 20,
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            onPressed: () {},
            child: WebsafeSvg.asset(
              "assets/icons/add_fill.svg",
              color: kSecondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
