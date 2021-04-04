import 'package:bogdashka/config/env.dart';
import 'package:bogdashka/models/GroupPay.dart';
import 'package:bogdashka/models/LogPassPay.dart';
import 'package:dio/dio.dart';

const bool isProduction = bool.fromEnvironment('dart.vm.product');
Map<String, String> env;

class RestApiProvider {
  final String serverURL =
      isProduction ? (envProduction['server']) : (envDev['server']);
  final Dio http = Dio();
  Future<bool> getLogPassPay(IPayLogPass pay) async {
    try {
      return (await http.post(serverURL + '/process/logpass/pay/qiwi',
              data: pay.toJson()))
          .data();
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return false;
    }
  }

  Future<List<dynamic>> checkUserAtGroup(String name) async {
    try {
      return (await http
              .post(serverURL + '/user/group/time', data: {"userName": name}))
          .data;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<String> getPayGroup(GroupPay groupPay) async {
    try {
      return (await http.post(serverURL + '/pay/group',
              data: groupPay.toJson()))
          .data;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }
}

final restProvider = new RestApiProvider();
