import 'package:bogdashka/helper/Router.dart';
import 'package:bogdashka/screens/main/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'components/widgets/Notification.dart';

import 'helper/Theme.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

void main() async {
  await GetStorage.init();
  await Firebase.initializeApp();

  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
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
              : Center(child: CircularProgressIndicator()),
        ));
  }
}

Widget buildLoadingWidget() {
  return Center(child: CircularProgressIndicator());
}
