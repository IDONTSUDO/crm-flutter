import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';
import '../../constants.dart';

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({
    Key key,
    this.height = 31,
    this.width = 34,
    this.iconSize = 13,
    this.color = kSecondaryColor,
    @required this.svgSrc,
    @required this.press,
  }) : super(key: key);

  final double height, width, iconSize;
  final Color color;
  final String svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: FlatButton(
        color: color,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(6)),
        ),
        onPressed: press,
        child: WebsafeSvg.asset(
          svgSrc,
          width: iconSize,
          color: Colors.white,
        ),
      ),
    );
  }
}
