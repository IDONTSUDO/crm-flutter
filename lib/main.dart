import 'package:bogdashka/helper/Router.dart';
import 'package:bogdashka/screens/group/group.screen.dart';
import 'package:bogdashka/screens/log_pass/log_pass.screen.dart';
import 'package:bogdashka/screens/main/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'components/widgets/AnimatedBackground.dart';
import 'components/widgets/Notification.dart';

import 'helper/Theme.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

void main() async {
  await GetStorage.init(); // add this

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
        routes: mainRouter,
        title: 'BOGDA\$HKA | Купить робуксы',
        theme: themeData(context),
        themeMode: ThemeMode.dark,
        darkTheme: darkThemeData(context),
        home: FutureBuilder<FirebaseApp>(
          future: Firebase.initializeApp(),
          builder: (context, snapshot) => snapshot.hasData
              ? Stack(children: [
                  MainScreen(),
                  NotificationPopover(),
                ])
              : Center(child: CircularProgressIndicator()), // SplashScreen
        ));
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