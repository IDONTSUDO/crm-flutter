import 'package:flutter/material.dart';
import 'package:jetti/controllers/router.controller.dart';
import 'package:jetti/screens/dashboard/dashboard_screen.dart';
import 'package:jetti/screens/message/message_screen.dart';
import 'package:jetti/screens/order/order_screen.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../constants.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: routerActiveService.stream$,
        builder: (BuildContext context, AsyncSnapshot snap) {
          print(snap.data);
          return Container(
            width: 230,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(13)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: WebsafeSvg.asset("assets/icons/logo.svg",
                      height: 200, width: 200),
                ),
                SideMenuItem(
                  svgSrc: "assets/icons/local_grocery_store.svg",
                  text: "Payment List",
                  press: () {
                    Navigator.pushNamed(context, OrderScreen.path);
                  },
                  isActive: true,
                ),
                SideMenuItem(
                  svgSrc: "assets/icons/messenger.svg",
                  text: "Message List",
                  press: () {
                    Navigator.pushNamed(context, MessageScreen.path);
                  },
                ),
                SideMenuItem(
                  svgSrc: "assets/icons/groups.svg",
                  text: "Roblox",
                  press: () {},
                ),
                SideMenuItem(
                  svgSrc: "assets/icons/refer.svg",
                  text: "Referal",
                  press: () {},
                ),
                SideMenuItem(
                  svgSrc: "assets/icons/Settings.svg",
                  text: "Settings",
                  press: () {},
                ),
              ],
            ),
          );
        });
  }
}

class SideMenuItem extends StatelessWidget {
  const SideMenuItem({
    Key key,
    @required this.svgSrc,
    @required this.text,
    @required this.press,
    this.isActive = false,
  }) : super(key: key);

  final String svgSrc, text;
  final VoidCallback press;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              isActive ? Colors.white : Colors.transparent,
              isActive ? Color(0xFFE7EEF0) : Colors.transparent,
            ],
          ),
          border: isActive
              ? Border(
                  right: BorderSide(color: Color(0xFF215363), width: 3),
                )
              : null,
        ),
        child: Row(
          children: [
            WebsafeSvg.asset(svgSrc, height: 16),
            SizedBox(width: 10),
            Text(
              text,
              style: Theme.of(context).textTheme.subtitle2,
            )
          ],
        ),
      ),
    );
  }
}
