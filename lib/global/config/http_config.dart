import 'dart:io';

import 'app_config.dart';

final class HttpConfig {

  static final HttpConfig _instance = HttpConfig._internal();
  static HttpConfig get instance => _getInstance();
  static HttpConfig _getInstance() => _instance;
  HttpConfig._internal();


  static const String lCode = "YouNiu";
  static const String sCode = "YouNiuBusinessAppApplication";
  static String get sourceFlag => Platform.isAndroid ? "1" : Platform.isIOS ? "2" : "0";
  static const String appSecret = "33758f41-f8ec-11ec-a583-e0d55e5b47d6";
  /// 高德地图Web服务Api Key
  static const String amapWebApiKey = "565cd8d1564077caa69cad491ce7febf";

  /// 是否是debug环境
  static bool get isTest => AppConfig.instance.env == "test";

  /// 是否是预发布环境
  static bool get isPreRelease => AppConfig.instance.env == "prerelease";

  /// 是否是发布环境
  static bool get isRelease => AppConfig.instance.env == "release";

  /// 网络请求Domain
  static String get domain => isTest
      ? HttpDomain.debug
      : isPreRelease
      ? HttpDomain.preRelease
      : HttpDomain.release;

  /// H5 Host
  static String get h5Domain => isTest
      ? HttpH5Domain.debug
      : isPreRelease
      ? HttpH5Domain.preRelease
      : HttpH5Domain.release;

  /// 高德地图输入提示服务Api
  static String get amapDomain => "restapi.amap.com";
}

/// 网络请求 Domain
class HttpDomain {
  static const String release = "appapi.youniumalls.com";
  static const String preRelease = "appapi.testing.youniumalls.com";
  static const String debug = "192.168.22.112:9103";
}

/// Share Config host
class HttpH5Domain {
  static const String release = 'https://shoph5.youniumalls.com';
  static const String preRelease = 'http://shoph5.testing.youniumalls.com';
  static const String debug = "http://192.168.22.34:4001";

}