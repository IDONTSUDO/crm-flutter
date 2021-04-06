import 'package:bogdashka/models/CheckUserGroup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

Widget getGroupHeader(List<PayProcess> groups) {
  if (isGroupPayPartial(groups)) {
    return Container(
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.black87,
      ),
      height: 60,
      child: Row(
        children: [
          Container(width: 10),
          Text(
            'СПИСОК ГРУПП КУДА' + '\n' + 'НУЖНО ВСТУПИТЬ',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          Spacer(),
        ],
      ),
    );
  }
  return Container();
}

bool isGroupPayPartial(List<PayProcess> listGroup) {
  bool status = true;
  listGroup.forEach((element) {
    if (element.status) {
      status = false;
    }
  });
  return status;
}

Widget groupListBuilde(PayProcess group) {
  return Container(
    margin: EdgeInsets.all(3),
    decoration: BoxDecoration(
      color: Colors.black87,
    ),
    height: 30,
    child: InkWell(
      child: Row(
        children: [
          Spacer(),
          Text(
            'Ссылка на вступление в группу *',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w100),
          ),
          Spacer(),
        ],
      ),
      onTap: () {
        launch(group.url);
      },
    ),
  );
}

Widget linerLocal() {
  return Container(
      margin: EdgeInsets.all(3), width: 200, height: 2, color: Colors.white);
}

String groupAllBalanceAtUserToPosible(List<PayProcess> listGroup) {
  double balance = 0;
  listGroup.forEach((element) {
    if (element.status) {
      balance += element.balance;
    }
  });
  return balance.toString();
}
