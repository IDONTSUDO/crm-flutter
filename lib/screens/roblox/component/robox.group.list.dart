import 'package:flutter/material.dart';
import 'package:jetti/controllers/roblox_controller.dart';
import 'package:jetti/models/Robox.dart';

import 'package:jetti/screens/order/components/rounded_container.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../constants.dart';
import '../../../main.dart';

class RoboxList extends StatefulWidget {
  @override
  _RoboxListState createState() => _RoboxListState();
}

class _RoboxListState extends State<RoboxList> {
  @override
  // ignore: must_call_super

  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: roboxService.getRobox(),
      builder: (context, AsyncSnapshot<List<Robox>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.length == 0) {
            return Text('Не добавлено ни одной точки');
          } else {
            return SizedBox(
              height: 750,
              width: 1000,
              child: RoundedContainer(
                title: "Groups Details",
                borderRadius:
                    const BorderRadius.only(topRight: Radius.circular(13)),
                children: [
                  for (var item in snapshot.data)
                    buildGroup(context,
                        leftData: item.balance.toString(),
                        leftTitle: 'balance',
                        rightData: item.groupId,
                        rightTitle: 'id',
                        right: item.status,
                        model: item),
                  Spacer(),
                  Spacer(flex: 2),
                ],
              ),
            );
          }
        } else {
          return buildLoadingWidget();
        }
      },
    );
  }

  Padding buildGroup(BuildContext context,
      {@required String leftData,
      @required String rightData,
      @required String leftTitle,
      @required String rightTitle,
      @required bool right,
      @required Robox model}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.75),
      child: Row(
        children: [
          Expanded(
            child: Text.rich(
              TextSpan(
                text: "$leftData\n",
                children: [
                  TextSpan(
                    text: leftTitle,
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(color: kSecondaryColor),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Text.rich(
              TextSpan(
                text: "$rightData\n",
                children: [
                  TextSpan(
                    text: rightTitle,
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(color: kSecondaryColor),
                  ),
                ],
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.75),
              child: InkWell(
                onTap: () {
                  //  model
                  roboxService.deleteRobox(model.id);
                },
                child: WebsafeSvg.asset('icons/dustbin.svg', height: 16),
              )),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.75),
              child: InkWell(
                onTap: () {
                  _roboxEditor(model);
                },
                child: WebsafeSvg.asset('icons/edit.svg', height: 16),
              )),
          Container(
              width: 25,
              height: 25,
              color: right ? (Colors.green) : (Colors.red))
        ],
      ),
    );
  }

  Future<void> _roboxEditor(Robox model) async {
    final object = {
      'balance': model.balance.toString(),
      'cookies': model.cookies,
      "groupId": model.groupId
    };
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: <Widget>[
            ButtonBar(children: [
              TextButton(
                child: Text('Edit'),
                onPressed: () {
                  print(object);
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
                  initialValue: model.balance.toString(),
                  onChanged: (e) => {
                    object.addAll({"balance": e})
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Поле Название не может быть пустым!1';
                    }
                    return null;
                  },
                ),
                Text(
                  'Cookies',
                  style: TextStyle(fontSize: 32),
                ),
                TextFormField(
                  initialValue: model.cookies.toString(),
                  onChanged: (e) => {
                    object.addAll({"cookies": e})
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Поле email не может быть пустым!1';
                    }
                    return null;
                  },
                ),
                Text(
                  'Group ID',
                  style: TextStyle(fontSize: 32),
                ),
                TextFormField(
                  initialValue: model.groupId,
                  onChanged: (e) => {
                    object.addAll({"groupId": e})
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Поле пароль не может быть пустым!1';
                    }
                    return null;
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

// right