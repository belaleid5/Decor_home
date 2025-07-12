import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(methodCount: 0, colors: true, printEmojis: true),
);

class LoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requestPath = '${options.baseUrl}${options.path}';
    logger.i('🚀 ${options.method} REQUEST → $requestPath');
    if (options.headers.isNotEmpty) {
      logger.d('🔐 Headers: ${options.headers}');
    }
    if (options.queryParameters.isNotEmpty) {
      logger.d('🔎 Query: ${options.queryParameters}');
    }
    if (options.data != null) {
      logger.d('📦 Body: ${options.data}');
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final requestPath = '${response.requestOptions.baseUrl}${response.requestOptions.path}';
    logger.i('✅ RESPONSE ← $requestPath');
    logger.d('📥 Status: ${response.statusCode} ${response.statusMessage}');
    logger.d('📦 Data: ${response.data}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';
    logger.e('❌ ERROR ← $requestPath');
    logger.e('📛 Type: ${err.type} | Message: ${err.message}');
    if (err.response != null) {
      logger.e('📥 Response: ${err.response?.data}');
      logger.e('🧾 Status Code: ${err.response?.statusCode}');
    }

    handler.next(err);
  }
}
