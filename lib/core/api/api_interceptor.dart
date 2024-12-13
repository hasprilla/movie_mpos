import 'package:dio/dio.dart';

import '../utils/logger.dart';
import 'api_url.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.baseUrl = ApiUrl.baseUrl;
    options.queryParameters = {'api_key': ApiUrl.apiKey};
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger.e(err.response?.statusCode);
    super.onError(err, handler);
  }
}
