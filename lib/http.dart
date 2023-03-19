import 'package:dio/dio.dart';
import 'package:weather_counter_app/config.dart';

class Http {
  // Dio with a BaseOptions instance.
  static final BaseOptions _baseOptions = BaseOptions(
    baseUrl: Config.baseUrl,
    connectTimeout: Duration(milliseconds: Config.connectTimeout),
    receiveTimeout: Duration(milliseconds: Config.receiveTimeout),
  );

  static Future<Map<String, dynamic>> get({
    required String path,
    BaseOptions? baseOptions,
  }) =>
      Dio(baseOptions ?? _baseOptions).get(path).then(
            (value) => value.data,
          );
}
