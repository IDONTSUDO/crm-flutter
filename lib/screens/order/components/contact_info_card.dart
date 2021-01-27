import 'package:flutter/material.dart';
import 'package:bogdashka/components/buttons/add_button.dart';
import 'package:bogdashka/components/buttons/rounded_icon_button.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../constants.dart';
import 'rounded_container.dart';

class ContactInfoCard extends StatelessWidget {
  const ContactInfoCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      title: "Contact Info",
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(13),
        bottomLeft: Radius.circular(13),
      ),
      children: [
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.75),
          child: SizedBox(
            height: 103,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Pic
                Container(
                  height: double.infinity,
                  width: 99,
                  decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: const BorderRadius.all(
                        Radius.circular(kDefaultPadding / 2)),
                  ),
                  child: WebsafeSvg.asset("assets/icons/user.svg", height: 30),
                ),
                SizedBox(width: kDefaultPadding * 0.75),
                // Other info
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                WebsafeSvg.asset(
                                  "assets/icons/phone.svg",
                                  height: 12,
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                  child: Text(
                                    "+7 912 999 99 99",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          RoundedIconButton(
                            svgSrc: "assets/icons/info.svg",
                            press: () {},
                          ),
                          SizedBox(width: 10),
                          RoundedIconButton(
                            svgSrc: "assets/icons/message.svg",
                            press: () {},
                          ),
                          SizedBox(width: 10),
                          RoundedIconButton(
                            color: kGreenColor,
                            svgSrc: "assets/icons/add_fill.svg",
                            press: () {},
                          ),
                        ],
                      ),
                      buildRow(
                        svgSrc: "assets/icons/user.svg",
                        text: "Zesan Howlader",
                      ),
                      buildRow(
                        svgSrc: "assets/icons/cake.svg",
                        text: "27-05-1998",
                      ),
                      buildRow(
                        svgSrc: "assets/icons/burger.svg",
                        text: "34",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(kDefaultPadding * 0.75),
          child: TextField(
            style: TextStyle(fontSize: 14),
            decoration: InputDecoration(
              filled: true,
              fillColor: kBackgroundColor,
              hintStyle: Theme.of(context).textTheme.caption,
              hintText: "Write something...",
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(6),
              ),
              suffixIcon: Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                width: 60,
                child: AddButton(
                  press: () {},
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildRow({@required String text, @required String svgSrc}) {
    return Row(
      children: [
        WebsafeSvg.asset(
          svgSrc,
          height: 12,
        ),
        SizedBox(width: kDefaultPadding / 2),
        Expanded(child: Text(text, maxLines: 1)),
      ],
    );
  }
}
