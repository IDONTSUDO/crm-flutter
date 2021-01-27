import 'package:bogdashka/screens/settings/settings_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:bogdashka/screens/dashboard/dashboard_screen.dart';
import 'package:bogdashka/screens/logIn/login_screen.dart';
import 'package:bogdashka/screens/message/message_screen.dart';
import 'package:bogdashka/screens/order/order_screen.dart';
import 'package:bogdashka/screens/roblox/roblox.screen.dart';

import 'helper/navigator.dart';

final Map<String, WidgetBuilder> mainRouter = {
  OrderScreen.path: (ctx) =>
      RouteAwareWidget(OrderScreen.path, child: OrderScreen()),
  LoginScreen.path: (ctx) => LoginScreen(),
  DashboardScreen.path: (ctx) =>
      RouteAwareWidget(DashboardScreen.path, child: DashboardScreen()),
  MessageScreen.path: (ctx) =>
      RouteAwareWidget(MessageScreen.path, child: MessageScreen()),
  RobloxScreen.path: (ctx) =>
      RouteAwareWidget(RobloxScreen.path, child: RobloxScreen()),
  SettingsScrenn.path: (ctx) =>
      RouteAwareWidget(SettingsScrenn.path, child: SettingsScrenn())
};
