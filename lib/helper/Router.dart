import 'package:bogdashka/helper/Navigator.dart';
import 'package:bogdashka/screens/group/group.screen.dart';
import 'package:bogdashka/screens/log_pass/log_pass.screen.dart';
import 'package:bogdashka/screens/main/main_screen.dart';
import 'package:bogdashka/screens/transfer/transfer.screen.dart';
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
  TransferScreen.path: (ctx) =>
      RouteAwareWidget(TransferScreen.path, child: TransferScreen()),
  LogPassScreen.path: (ctx) =>
      RouteAwareWidget(LogPassScreen.path, child: LogPassScreen()),
  GroupScreen.path: (ctx) =>
      RouteAwareWidget(GroupScreen.path, child: GroupScreen()),
};
