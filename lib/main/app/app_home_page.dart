import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_youniu_app/pages/modules/login/page/login_page.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AppHomePage extends StatefulWidget {
  const AppHomePage({super.key});

  @override
  State<AppHomePage> createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  final _refreshCtl = RefreshController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          controller: _refreshCtl,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: ListView.builder(
            itemCount: 20,
            itemExtent: 50.r,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => Get.to(() => const LoginPage()),
                child: Card(
                  child: Center(
                    child: Text("这是 Card $index"),
                  ),
                ),
              );
            },
          ),
        ));
  }

  void _onRefresh() {}

  void _onLoading() {}
}
