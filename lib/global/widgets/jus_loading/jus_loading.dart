import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class JusLoading {
  static final JusLoading _instance = JusLoading._internal();
  static JusLoading get instance => _getInstance();
  static JusLoading _getInstance() => _instance;
  JusLoading._internal();

  static void config() {
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.custom
      ..radius = 5.r
      ..textColor = Colors.black
      ..indicatorColor = Colors.white
      ..backgroundColor = Colors.white
      ..progressColor = Colors.white
      ..maskColor = Colors.transparent
      ..userInteractions = true
      ..dismissOnTap = false
      ..boxShadow = [BoxShadow(color: Colors.black.withOpacity(0.3), offset: Offset.zero, blurRadius: 10)]
      ..displayDuration = const Duration(milliseconds: 2000)
      ..contentPadding = EdgeInsets.all(20.r)
      ..textStyle = TextStyle(fontWeight: FontWeight.w500, fontSize: 17.sp, color: Colors.white)
      ..indicatorWidget = ClipRRect(borderRadius: BorderRadius.circular(5.r), child: Image(image: const AssetImage('images/loading/yn_loading.gif'), width: 65.r, height: 65.r, fit: BoxFit.cover),);
  }
}