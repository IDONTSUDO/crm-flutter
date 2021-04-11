import 'package:bogdashka/components/MainScalford.dart';
import 'package:bogdashka/helper/Navigator.dart';
import 'package:bogdashka/screens/main/main_screen.dart';
import 'package:bogdashka/screens/payCheck/PayCheck_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

// final Map<String, WidgetBuilder> mainRouter = {
//   MainScreen.path: (ctx) => MainScreen(),
//   TransferScreen.path: (ctx) => TransferScreen(),
//   LogPassScreen.path: (ctx) => LogPassScreen(),
//   GroupScreen.path: (ctx) => GroupScreen()
// };

final Map<String, WidgetBuilder> mainRouter = {
  MainScreen.path: (ctx) =>
      RouteAwareWidget(MainScreen.path, child: MainScreen()),
  PayCheck.path: (ctx) => (RouteAwareWidget(PayCheck.path, child: PayCheck())),
};

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case '/':
      //   return MaterialPageRoute(builder: (_) => Home());
      // case '/feed':
      //   return MaterialPageRoute(builder: (_) => Home());
      // default:
      //   return MaterialPageRoute(builder: (_) => Home());
    }
  }
}
