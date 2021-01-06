import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jetti/controllers/auth_controller.dart';
import 'package:jetti/screens/dashboard/dashboard_screen.dart';
import 'package:jetti/screens/logIn/login_screen.dart';
import 'package:jetti/screens/order/order_screen.dart';
import 'enums.dart';
import 'theme.dart';

void main() async {
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jetti',
      theme: buildThemeData(context),
      home: OrderScreen(),
      // home: GetBuilder<AuthController>(
      //   init: AuthController.instance(),
      //   builder: (auth) => _showScreen(context, auth),
      // ),
    );
  }
}

Widget _showScreen(BuildContext context, AuthController auth) {
  switch (auth.appState) {
    case AppState.authenticating:
    case AppState.unauthenticated:
    case AppState.initial:
      return LoginScreen();
    case AppState.authenticated:
      return DashboardScreen();
  }
  return Container();
}
