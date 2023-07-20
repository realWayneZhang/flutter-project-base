
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: (){
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          } else {
            EasyLoading.show();
          }
        },
        child:  const Center(
          child: Text('这是登录页面'),
        ),
      ),
    );
  }


}