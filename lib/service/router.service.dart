import 'package:rxdart/rxdart.dart';

RouterProvider routerActiveService = RouterProvider();

class RouterProvider {
  // ignore: close_sinks
  BehaviorSubject<String> router = BehaviorSubject.seeded('');

  BehaviorSubject<String> get routerActive => router.stream;
  Stream get stream$ => routerActive.stream;
  void newPath(String path) {
    routerActive.add(path);
  }
}
