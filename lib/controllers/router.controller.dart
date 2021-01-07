import 'package:rxdart/rxdart.dart';

RouterProvider routerActiveService = RouterProvider();

class RouterProvider {
  BehaviorSubject<String> get routerActive => BehaviorSubject.seeded('21312');
  Stream get stream$ => routerActive.stream;
  void newPath(String path) {
    print('add:' + path);
    routerActive.add(path);
    print(routerActive.value + 'value state');
  }
}
