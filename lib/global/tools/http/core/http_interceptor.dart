import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_youniu_app/generated/json/base/base_res_model.dart';

import 'http_error.dart';

class HttpInterceptor extends Interceptor {

  late DateTime startTime;
  late DateTime endTime;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    startTime = DateTime.now();

    if (kDebugMode) {
      print('---------------------------- Http Interceptor Start !!! ------------------------------------');
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    endTime = DateTime.now();
    int duration = endTime.difference(startTime).inMilliseconds;
    if (kDebugMode) {
      print('---------------------------- Http Interceptor End: ${duration / 1000} 秒 ------------------------------------');
    }

    BaseResModel res = BaseResModel.fromJson(response.data);
    if (!res.success) {
      var serverError = HttpServerError(res.code, success: res.success, statusMessage: res.message);
      HttpErrorHandler.handleServerError(serverError);
    }
    response.data = res;
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print('---------------------------- Http Interceptor Error ------------------------------------');
    }
    var netError = HttpNetError(err.response?.statusCode ?? -1, errorType: err.type, dioMessage: err.response?.statusMessage ?? '');
    HttpErrorHandler.handleNetError(netError);
    handler.next(err);
  }
}