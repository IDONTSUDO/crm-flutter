import 'package:rxdart/rxdart.dart';
import 'dart:async';

class Bloc {
  // ignore: close_sinks
  final BehaviorSubject<String> _subject = BehaviorSubject<String>();

  notification(textErr) async {
    _subject.add(textErr.toString());
    Timer(Duration(seconds: 3), () => _subject.add(''));
  }

  BehaviorSubject<String> get subject => _subject;
}

final notificationBloc = Bloc();
