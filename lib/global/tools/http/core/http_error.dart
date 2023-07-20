import 'package:dio/dio.dart';

abstract class HttpError {
  final int code;
  final String message;

  HttpError({required this.code, required this.message});
}

class HttpNetError implements HttpError {

  final int dioCode;
  final String dioMessage;
  final DioExceptionType errorType;

  @override
  int get code => dioCode;

  @override
  String get message => dioMessage;

  HttpNetError(this.dioCode, {required this.errorType, required this.dioMessage});

}

class HttpServerError implements HttpError {

  final bool success;
  final String statusCode;
  final String statusMessage;

  HttpServerError(this.statusCode, {required this.success, required this.statusMessage});

  @override
  int get code => 200;

  @override
  String get message => statusMessage;
}

class HttpErrorHandler {
  // 网络层面错误
  static void handleNetError (HttpNetError error) {
    switch (error.errorType) {
      case DioExceptionType.connectionTimeout:
        break;
      case DioExceptionType.sendTimeout:
        break;
      case DioExceptionType.receiveTimeout:
        break;
      case DioExceptionType.badResponse:
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.badCertificate:
        break;
      case DioExceptionType.unknown:
        break;
      case DioExceptionType.connectionError:
        break;
    }
  }

  // 服务器报错
  static void handleServerError(HttpServerError error) {
    switch (error.statusCode) {
      case "LOGIN000001":
      // TODO 拉起登录
      // //JusHUD.showToast(status: error.message);
      //   if (UserManager.instance.isLogin) {
      //     UserManager.instance.loginOut();
      //   }
        break;
      case "LOGIN000002":
      // TODO 拉起登录
      //JusHUD.showToast(status: error.message);
      //   if (UserManager.instance.isLogin) {
      //     UserManager.instance.loginOut();
      //   }
        break;
      case "LOGIN000003":
      // TODO 拉起登录
      //JusHUD.showToast(status: error.message);
      //   if (UserManager.instance.isLogin) {
      //     UserManager.instance.loginOut();
      //   }
        break;
      case "AUTH000001":
      // JusHUD.showToast(status: "访问被拒绝,需要授权");
        break;
      case "ANN000001":
      // JusHUD.showToast(status: "注解参数错误");
        break;
      case "PAM000002":
        break;
      default:
      // JusHUD.showToast(status: error.message);
        break;
    }
  }
}

