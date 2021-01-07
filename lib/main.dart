import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jetti/controllers/auth_controller.dart';
import 'package:jetti/routes.dart';
import 'package:jetti/screens/dashboard/dashboard_screen.dart';
import 'package:jetti/screens/logIn/login_screen.dart';
import 'package:jetti/screens/order/order_screen.dart';
import 'enums.dart';
import 'theme.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

void main() async {
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorObservers: [routeObserver],
        title: 'BogdashkaCRM',
        theme: buildThemeData(context),
        routes: mainRouter,
        home: OrderScreen());
  }
}

Widget buildLoadingWidget() {
  return Center(child: CircularProgressIndicator());
}
//  return FutureBuilder(
//         future: _initialization,
//         builder: (context, appSnapshot) {
//           return GetMaterialApp(
//               debugShowCheckedModeBanner: false,
//               title: 'BogdashkaCRM',
//               theme: buildThemeData(context),
//               routes: mainRouter,
//               home: appSnapshot.connectionState != ConnectionState.done
//                   ? LoginScreen()
//                   : StreamBuilder(
//                       stream: FirebaseAuth.instance.authStateChanges(),
//                       builder: (ctx, userSnapshot) {
//                         if (userSnapshot.hasData) {
//                           return OrderScreen();
//                         }
//                         return LoginScreen();
//                       }));
//         });