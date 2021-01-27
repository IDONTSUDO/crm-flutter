import 'package:bogdashka/screens/order/components/rounded_container.dart';
import 'package:flutter/material.dart';

class Control extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 750,
      width: 900,
      child: RoundedContainer(
        title: "Settings control",
        borderRadius: const BorderRadius.only(topRight: Radius.circular(13)),
        children: [
         
              Row(
                children: [
                  Text('New pay with out login',
                      style: TextStyle(fontSize: 20)),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter you login',
                    ),
                  ),
                ],
              ),
          SizedBox(height: 200, width: 200, child: Text('200')),
          Spacer(),
          Text('ACTION'),
          ButtonBar(alignment: MainAxisAlignment.center, children: [
            RaisedButton(onPressed: null, child: Text('Sync Server')),
            RaisedButton(onPressed: null, child: Text('1'))
          ]),
        ],
      ),
    );
  }
}
