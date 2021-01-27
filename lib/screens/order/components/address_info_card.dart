import 'package:flutter/material.dart';
import 'package:bogdashka/components/buttons/rounded_icon_button.dart';
import 'package:bogdashka/components/buttons/selected_button.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../constants.dart';
import '../../../extensions.dart';
import 'rounded_container.dart';

class AddressInfoCard extends StatelessWidget {
  const AddressInfoCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: RoundedContainer(
        title: "Restaurant/address info",
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(13)),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding * 0.75,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      WebsafeSvg.asset("assets/icons/building.svg"),
                      SizedBox(width: kDefaultPadding / 2),
                      Expanded(
                        child: Text(
                          "Moscow",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ).filledText(),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: kDefaultPadding),
                SelectedButton(
                  text: "Delivery",
                  leftIconSrc: "assets/icons/hand.svg",
                  rightIconSrc: "assets/icons/bike.svg",
                  isLeftIconSelected: true,
                  pressLeft: () {},
                  pressRight: () {},
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.75),
            child: Row(
              children: [
                WebsafeSvg.asset("assets/icons/store.svg"),
                SizedBox(width: kDefaultPadding / 2),
                Expanded(
                  child: Text(
                    "SM_RU Mosсow-01, Mira st, 10",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ).filledText(),
                ),
                SizedBox(width: kDefaultPadding),
                RoundedIconButton(
                  svgSrc: "assets/icons/info.svg",
                  press: () {},
                ),
                SizedBox(width: 5),
                RoundedIconButton(
                  svgSrc: "assets/icons/renew.svg",
                  press: () {},
                )
              ],
            ),
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}
