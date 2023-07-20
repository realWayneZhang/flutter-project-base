import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_youniu_app/global/widgets/refresh/jus_nor_footer.dart';
import 'package:flutter_youniu_app/global/widgets/refresh/jus_nor_header.dart';
import 'package:flutter_youniu_app/main/app/app_initializing_page.dart';
import 'package:flutter_youniu_app/main/app/app_launch_page.dart';
import 'package:flutter_youniu_app/main/binding/app_controller_binding.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../global/config/app_config.dart';
import '../../global/tools/package/app_package_info.dart';
import '../../global/widgets/common/no_splash_factory.dart';
import '../../global/widgets/jus_loading/jus_loading.dart';

part 'app.g.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    // 极光推送
    // _initJPush();
    // 微信
    // _initFluwx();
    // 高德
    // _registerAmap();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //  记住修改
    return FutureBuilder(
      future: _futureInit(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        // 创建 App 前的初始化，如工具、第三方库等
        var initDone = snapshot.connectionState == ConnectionState.done;
        Widget home = initDone ? _launchPage: _initializingPage;
        return _createAppScreen(home);
      },
    );
  }
}
