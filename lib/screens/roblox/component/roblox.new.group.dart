import 'package:flutter/material.dart';
import 'package:bogdashka/controllers/roblox_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:uuid/uuid.dart';

class RobloxNewGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      child: new Ink(
        color: Colors.green,
        height: 20,
        child: new InkWell(
          splashColor: Colors.blue,
          child: Center(
              child: Text(
            'New Robox Group',
            style: TextStyle(color: Colors.white),
          )),
          onTap: () {
            _roboxNew(context);
          },
        ),
      ),
    );
  }

  Future<void> _roboxNew(context) async {
    var uuid = Uuid();
    final object = {'balance': '', 'cookies': '', "groupId": ''};
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: <Widget>[
            ButtonBar(children: [
              TextButton(
                child: Text('Save'),
                onPressed: () {
                  object['id'] = uuid.v4();
                  roboxService.newRobox(object);
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ]),
          ],
          title: Text(
            'Edit robox group',
            style: TextStyle(fontSize: 20),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Balance',
                  style: TextStyle(fontSize: 32),
                ),
                TextFormField(
                  onChanged: (e) => {
                    object.addAll({"balance": e})
                  },
                ),
                Text(
                  'Cookies',
                  style: TextStyle(fontSize: 32),
                ),
                TextFormField(
                  onChanged: (e) => {
                    object.addAll({"cookies": e})
                  },
                ),
                Text(
                  'Group ID',
                  style: TextStyle(fontSize: 32),
                ),
                TextFormField(
                  onChanged: (e) => {
                    object.addAll({"groupId": e})
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
