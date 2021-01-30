import 'package:bogdashka/screens/order/order_screen.dart';
import 'package:rxdart/rxdart.dart';

RouterProvider routerActiveService = RouterProvider();

class RouterProvider {
  // ignore: close_sinks
  BehaviorSubject<String> router = BehaviorSubject.seeded(OrderScreen.path);

  BehaviorSubject<String> get routerActive => router.stream;
  Stream get stream$ => routerActive.stream;
  void newPath(String path) {
    routerActive.add(path);
  }
}
