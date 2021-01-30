import 'package:flutter/material.dart';

import '../../../constants.dart';

class MessageContainer extends StatelessWidget {
  const MessageContainer({
    Key key,
    @required this.children,
    @required this.title,
    this.borderRadius = const BorderRadius.all(
      Radius.circular(13),
    ),
  }) : super(key: key);

  final List<Widget> children;
  final String title;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: kDefaultPadding / 2),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ...children,
        ],
      ),
    );
  }
}
