import 'package:dio/dio.dart';
import 'package:instagram_flutter/core/config.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  Dio dio;

  static final DioClient _dioClient = DioClient._internal();

  factory DioClient() {
    return _dioClient;
  }

  DioClient._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: Config.value.apiBaseUrl,
    );
    dio = Dio(options);
    if (Config.value.enableNetworkLogging) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 120,
        ),
      );
    }
  }
}
