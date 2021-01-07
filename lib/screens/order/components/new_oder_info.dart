import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../components/buttons/selected_button.dart';
import '../../../constants.dart';
import 'rounded_container.dart';

class NewOrderInfo extends StatelessWidget {
  const NewOrderInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 800,
      child: RoundedContainer(
        title: "Payment info",
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding * 0.75),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Payment errors:",
                    maxLines: 1,
                  ),
                  SizedBox(height: kDefaultPadding / 2),
                  Text(
                    "0",
                    maxLines: 1,
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Spacer(),
                  Text(
                    "Groups:",
                    maxLines: 1,
                  ),
                  SizedBox(height: kDefaultPadding / 2),
                  Text(
                    "10",
                    maxLines: 1,
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Spacer(),
                  Text(
                    "P2P",
                    maxLines: 1,
                  ),
                  SizedBox(height: kDefaultPadding / 2),
                  Text(
                    "0",
                    maxLines: 1,
                    style: Theme.of(context).textTheme.caption,
                  ),
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.end,
                  //   children: [
                  //     buildContainer(context, text: "18-11-2020 | 15.25"),
                  //     const SizedBox(width: kDefaultPadding * 0.75),
                  //     buildContainer(context, text: "0:55"),
                  //     const SizedBox(width: kDefaultPadding * 0.75),
                  //     SelectedButton(
                  //       text: "Nearest",
                  //       leftIconSrc: "assets/icons/doted_clock.svg",
                  //       rightIconSrc: "assets/icons/clock_with_exclamation.svg",
                  //       isLeftIconSelected: true,
                  //       pressLeft: () {},
                  //       pressRight: () {},
                  //     ),
                  //   ],
                  // ),
                  Spacer(),
                  // Container(
                  //   padding: EdgeInsets.all(10),
                  //   constraints: BoxConstraints(
                  //     minHeight: 44,
                  //     minWidth: double.infinity,
                  //   ),
                  //   alignment: Alignment.centerLeft,
                  //   decoration: BoxDecoration(
                  //     color: kBackgroundColor,
                  //     borderRadius: const BorderRadius.all(Radius.circular(6)),
                  //   ),
                  //   child: Text(
                  //     "No comment from restaurant",
                  //     style: Theme.of(context).textTheme.caption,
                  //     maxLines: 3,
                  //   ),
                  // ),
                  // SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row buildContainer(BuildContext context, {@required String text}) {
    return Row(
      children: [
        WebsafeSvg.asset("assets/icons/clock.svg"),
        const SizedBox(width: 8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          decoration: BoxDecoration(
            color: kBackgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(6)),
          ),
          child: Text(
            text,
            style: Theme.of(context).textTheme.caption,
          ),
        ),
      ],
    );
  }
}
