import 'package:bogdashka/controllers/message_controller.dart';
import 'package:bogdashka/screens/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:bogdashka/controllers/router.controller.dart';
import 'package:bogdashka/screens/dashboard/dashboard_screen.dart';
import 'package:bogdashka/screens/message/message_screen.dart';
import 'package:bogdashka/screens/order/order_screen.dart';
import 'package:bogdashka/screens/roblox/roblox.screen.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../constants.dart';
import '../main.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            child: WebsafeSvg.asset("icons/logo.svg", height: 200, width: 200),
          ),
          SideMenuItem(
              svgSrc: "/icons/local_grocery_store.svg",
              text: "Payment List",
              press: () {
                Navigator.pushNamed(context, OrderScreen.path);
              },
              path: OrderScreen.path),
          StreamBuilder<Object>(
              stream: messageService.messageCountSteam$,
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  return SideMenuItem(
                      svgSrc: "icons/messenger.svg",
                      text: "Message List",
                      counter: snapshot.data.toString(),
                      press: () {
                        Navigator.pushNamed(context, MessageScreen.path);
                      },
                      path: MessageScreen.path);
                } else {
                  return SideMenuItem(
                      svgSrc: "icons/messenger.svg",
                      text: "Message List",
                      press: () {
                        Navigator.pushNamed(context, MessageScreen.path);
                      },
                      path: MessageScreen.path);
                }
              }),
          SideMenuItem(
              svgSrc: "icons/groups.svg",
              text: "Roblox",
              press: () {
                Navigator.pushNamed(context, RobloxScreen.path);
              },
              path: RobloxScreen.path),
          SideMenuItem(
              svgSrc: "icons/Settings.svg",
              text: "Settings",
              press: () {
                Navigator.pushNamed(context, SettingsScrenn.path);
              },
              path: SettingsScrenn.path),
        ],
      ),
    );
  }
}

class SideMenuItem extends StatelessWidget {
  const SideMenuItem({
    Key key,
    @required this.svgSrc,
    @required this.text,
    @required this.press,
    this.path,
    this.counter,
  }) : super(key: key);

  final String svgSrc, text;
  final VoidCallback press;

  final String path;
  final String counter;
  @override
  Widget build(BuildContext context) {
    bool active = false;
    return StreamBuilder(
        stream: routerActiveService.stream$,
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (this.path == snap.data) {
            active = true;
          }

          return InkWell(
            onTap: press,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    active ? Colors.white : Colors.transparent,
                    active ? Color(0xFFE7EEF0) : Colors.transparent,
                  ],
                ),
                border: active
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
                  ),
                  Spacer(),
                  counter != null
                      ? (Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                              color: Colors.red[500],
                              border: Border.all(
                                color: Colors.red[500],
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Center(
                              child: Text(
                            counter,
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          )),
                        ))
                      : (Container())
                ],
              ),
            ),
          );
        });
  }
}
