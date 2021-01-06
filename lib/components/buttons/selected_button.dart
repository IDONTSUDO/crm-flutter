import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../constants.dart';

class SelectedButton extends StatelessWidget {
  const SelectedButton({
    Key key,
    @required this.text,
    @required this.leftIconSrc,
    @required this.rightIconSrc,
    this.isLeftIconSelected = true,
    @required this.pressLeft,
    @required this.pressRight,
  }) : super(key: key);

  final String text, leftIconSrc, rightIconSrc;
  final bool isLeftIconSelected;
  final VoidCallback pressLeft, pressRight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.caption,
        ),
        Row(
          children: [
            SizedBox(
              height: 31,
              width: 37,
              child: FlatButton(
                color: kSecondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6),
                    bottomLeft: Radius.circular(6),
                  ),
                ),
                onPressed: pressLeft,
                child: WebsafeSvg.asset(
                  leftIconSrc,
                  color:
                      isLeftIconSelected ? kBackgroundColor : kSecondaryColor,
                ),
              ),
            ),
            SizedBox(
              height: 31,
              width: 37,
              child: FlatButton(
                color: kBackgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(6),
                    bottomRight: Radius.circular(6),
                  ),
                ),
                onPressed: pressRight,
                child: WebsafeSvg.asset(
                  rightIconSrc,
                  color:
                      !isLeftIconSelected ? kBackgroundColor : kSecondaryColor,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
