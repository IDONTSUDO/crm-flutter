import 'package:flutter/material.dart';

import '../../constants.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    Key key,
    @required this.press,
  }) : super(key: key);

  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: kSecondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      onPressed: press,
      child: Text(
        "Add",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
