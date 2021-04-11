import 'package:bogdashka/components/widgets/BoxFormTopTextLeftImage.dart';
import 'package:bogdashka/controllers/PayCheck.dart';
import 'package:bogdashka/helper/Constants.dart';
import 'package:flutter/material.dart';

class PayCheckInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _controllerNickName =
        new TextEditingController();
    return Container(
      color: colorCard,
      width: 400,
      child: TextField(
        style: new TextStyle(
          fontSize: 16,
        ),
        onChanged: (e) => {
          if (e.length > 3) {payCheckController.getCheckUser(e)}
        },
        controller: _controllerNickName,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Введите ник',
          labelStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
