import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../constants.dart';

class StatusButton extends StatelessWidget {
  const StatusButton({
    Key key,
    @required this.status,
    @required this.press,
  }) : super(key: key);

  final String status;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding * 0.75, vertical: kDefaultPadding / 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        children: [
          WebsafeSvg.asset("assets/icons/filter.svg", height: 15),
          SizedBox(width: kDefaultPadding / 2),
          Expanded(
            child: Text(
              "Status",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                color: Color(0xFF616161),
              ),
            ),
          ),
          Spacer(),
          FlatButton(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            height: 50,
            color: Color(0xFFE7EEF0),
            onPressed: press,
            child: Text(status),
          )
        ],
      ),
    );
  }
}
