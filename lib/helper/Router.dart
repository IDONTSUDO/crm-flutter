import 'package:bogdashka/helper/Navigator.dart';
import 'package:bogdashka/screens/main/main_screen.dart';

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
};
