import 'package:flutter_youniu_app/controller/app/app_controller.dart';
import 'package:flutter_youniu_app/controller/user/user_controller.dart';
import 'package:flutter_youniu_app/pages/modules/login/controller/login_controller.dart';
import 'package:get/get.dart';

class AppControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppController()); // app 控制器
    Get.lazyPut(() => UserController()); // 用户数据管理器
    Get.lazyPut(() => LoginController()); // 登录控制器
  }
}