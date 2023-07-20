import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';

import '../../../config/http_config.dart';
import 'http_interceptor.dart';



class Http {
  static final Http _instance = Http._();
  static Http get instance => Http();

  factory Http() => _instance;

  static late Dio _dio;
  Dio get dio => _dio;

  Http._() {
    // options
    final BaseOptions options = BaseOptions(
      receiveTimeout: const Duration(seconds: 10),
      connectTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 8),
      validateStatus: (_) => true,
      responseType: ResponseType.plain,
      baseUrl: HttpConfig.domain,
    );

    // 设置公共 Headers
    var headers = {
      "lCode": HttpConfig.lCode,
      "sCode": HttpConfig.sCode,
    };
    // aToken
    headers["aToken"] = '';
    options.headers = headers;

    _dio = Dio(options);
    // 忽略 https 证书校验
    if (kDebugMode) {
      (_dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () => HttpClient()..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    }
    // 添加日志拦截器
    dio.interceptors.add(LogInterceptor(request: true, requestHeader: true,requestBody: true, responseHeader: true, responseBody: true));
    // 添加拦截器
    _dio.interceptors.add(HttpInterceptor());
  }
}