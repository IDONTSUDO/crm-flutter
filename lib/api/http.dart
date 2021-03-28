import 'package:bogdashka/config/env.dart';
import 'package:dio/dio.dart';

const bool isProduction = bool.fromEnvironment('dart.vm.product');
Map<String, String> env;

class RestApiProvider {
  final String serverURL =
      isProduction ? (envProduction['server']) : (envDev['server']);
  final Dio http = Dio();
  Future<bool> editPoint() async {
    try {
      // await _dio.post(
      //   _endpoint + '/editpoint',
      //   queryParameters: {"id": point.id},
      //   data: point.toJson(),
      // );
      return true;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return false;
    }
  }
}
