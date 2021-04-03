import 'package:bogdashka/config/env.dart';
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
}

final restProvider = new RestApiProvider();
