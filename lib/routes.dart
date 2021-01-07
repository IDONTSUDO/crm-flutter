import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:jetti/screens/dashboard/dashboard_screen.dart';
import 'package:jetti/screens/logIn/login_screen.dart';
import 'package:jetti/screens/message/message_screen.dart';
import 'package:jetti/screens/order/order_screen.dart';
import 'package:jetti/screens/roblox/roblox.screen.dart';

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
      RouteAwareWidget(RobloxScreen.path, child: RobloxScreen())
};
