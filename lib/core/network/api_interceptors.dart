import 'package:busca_clima2/core/constants/api_constants.dart';
import 'package:dio/dio.dart';
import 'dart:developer' as dev;

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.putIfAbsent('appid', () => ApiConstants.apiKey);
    dev.log('${options.method} ${options.uri}', name: 'API.request');
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    dev.log(
      '${response.statusCode}, ${response.requestOptions.path}',
      name: 'API.response',
    );
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final statusCode = err.response?.statusCode ?? 'Sem resposta';
    dev.log(
      'status=$statusCode -- msg=${err.message}',
      name: 'API.error',
      level: 1000,
    );
    handler.next(err);
  }
}
