import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../constants.dart';

class BigButton extends StatelessWidget {
  const BigButton({
    Key key,
    this.isIcon = false,
    this.text,
    this.svgIcon,
    this.color = kRedColor,
    @required this.press,
  }) : super(key: key);

  final bool isIcon;
  final String text, svgIcon;
  final Color color;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      height: 68,
      minWidth: 100,
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(13),
        ),
      ),
      onPressed: () {},
      child: isIcon
          ? WebsafeSvg.asset(svgIcon, height: 25)
          : Text(
              "My orders",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
    );
  }
}
