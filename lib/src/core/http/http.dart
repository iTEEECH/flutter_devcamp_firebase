import 'package:dio/dio.dart';

class Http {
  static Http? _instance;

  Http get instance => _instance ??= Http();

  late Dio _dio;

  Dio get dio => _dio;

  Http() {
    // Timeout.
    const Duration timeout = Duration(seconds: 15);

    // Options.
    final BaseOptions options = BaseOptions(
      baseUrl: 'https://api.disneyapi.dev',
      contentType: Headers.jsonContentType,
      connectTimeout: timeout,
      receiveTimeout: timeout,
      validateStatus: (int? status) => status != null && status >= 200 && status < 400,
    );

    // Instance.
    _dio = Dio();
    _dio.options = options;
  }
}
