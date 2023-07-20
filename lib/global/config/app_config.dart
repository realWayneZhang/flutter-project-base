import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_youniu_app/global/tools/package/app_package_info.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

/// APP 配置
class AppConfig {
  //全局路由跳转上下文，可去除context
  static final navKey = GlobalKey<NavigatorState>();

  ///====================================== 单例 ======================================================
  static final AppConfig _instance = AppConfig._internal();

  static AppConfig get instance => _getInstance();

  static AppConfig _getInstance() => _instance;

  AppConfig._internal();

  ///==================================================================================================

  ///====================================== 配置信息 ===================================================
  static String appScheme = 'youniubusiness';
  static String bundleId = 'com.youniu.business';

  ///==================================================================================================

  ///====================================== 微信信息 ===================================================
  static String wxAppId = 'wxd4b3dbd273fda78e';
  static String wxAppSecret = 'cd73d615d30d43cf143d445ae9c56612';
  static String universalLink = "https://www.youniumalls.com/app/business/";

  ///==================================================================================================


  ///====================================== 极光推送 ===================================================
  static String jpushAppId = '1c2f276c7a86ae70b8a8fcfe';
  static String jpushSecret = '37273f9e70e11e70285651a6';

  ///==================================================================================================

  ///====================================== 高德地图 AppId ===================================================
  static String amapAndroidAppId = '9c3ed3e4fba50e173861e3983c3d037c';
  static String amapIOSAppId = '69f9fed336b462ba7311900f8344b269';

  ///==================================================================================================

  ///================================== 获取配置信息 ====================================================
  Future<AppConfig> init() async {
    Map<String, String> properties = {};
    String value = await rootBundle.loadString("assets/config.properties");
    List<String> list = value.split('\n');
    for (var e in list) {
      if (e.isNotEmpty && e.contains("=")) {
        String key = e.substring(0, e.indexOf("="));
        String value = e.substring(e.indexOf("=") + 1);
        properties[key] = value;
      }
    }
    _parserProperties(properties);
    return AppConfig.instance;
  }

  String env = "";
  String versionName = "";
  String versionCode = "";
  String time = '';

  void _parserProperties(Map<String, String> properties) {
    env = properties['env'] ?? 'test';
    versionName = properties['versionName'] ?? AppPackageInfo.version;
    versionCode = properties['versionCode'] ?? AppPackageInfo.buildNumber;
    time = properties['time'] ?? DateFormat("yyyyMMddHHmmss").format(DateTime.now());
  }

  ///================================================================================================

  ///========================================= 状态栏样式 ==================================================
  // static SystemUiOverlayStyle setStatusBarTextStyle({JusConfigStatusBarTextStyle style = JusConfigStatusBarTextStyle.dark}) {
  //   Brightness? statusBarIconBrightness;
  //   Brightness? statusBarBrightness;
  //   switch (style) {
  //     case JusConfigStatusBarTextStyle.dark:
  //       statusBarIconBrightness = Brightness.dark;
  //       statusBarBrightness = Brightness.light;
  //       break;
  //     case JusConfigStatusBarTextStyle.light:
  //       statusBarIconBrightness = Brightness.light;
  //       statusBarBrightness = Brightness.dark;
  //       break;
  //   }
  //   return SystemUiOverlayStyle(
  //     systemNavigationBarColor: Colors.white,
  //     systemNavigationBarDividerColor: null,
  //     statusBarColor: Colors.transparent,
  //     systemNavigationBarIconBrightness: Brightness.light,
  //     statusBarIconBrightness: statusBarIconBrightness,
  //     statusBarBrightness: statusBarBrightness,
  //   );
  // }

  ///====================================================================================================

  ///========================================= 拨打电话 ==================================================
  static void call(String phone) async {
    final uri = Uri(scheme: 'tel', path: phone);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      EasyLoading.showToast('电话号码有误');
    }
  }

  ///====================================================================================================

  ///========================================= 高德地图协议 ==================================================

  // static const AMapApiKey amapApiKeys = AMapApiKey(androidKey: '9c3ed3e4fba50e173861e3983c3d037c', iosKey: '69f9fed336b462ba7311900f8344b269');
  // static const AMapPrivacyStatement amapPrivacyStatement = AMapPrivacyStatement(hasContains: true, hasShow: true, hasAgree: true);

  ///======================================================================================================

  ///========================================= H5链接 ==================================================

  /// 用户协议
  static const ynUserAgreement = "https://www.youniumalls.com/H5/common/detail/yn_service_agreement";

  /// 隐私政策
  static const ynPrivacyPolicy = "https://www.youniumalls.com/H5/common/detail/PRIVACY_CODE";

  /// 赊销服务协议
  static const ynSellOnCreditProtocol = "https://h5.xunmascm.com/article/detail?code=yn_finance_agreement";

  /// 有牛平台合作协议
  static const ynCooperationProtocol = "https://www.youniumalls.com/H5/common/detail/Settlement_agreement";

  /// 有牛平台常见问题
  static const ynQuestions = "https://shoph5.youniumalls.com/common/app_use_pages/tpl/category-list?query=questions&hasTitle=true";
  ///======================================================================================================

  /// HTML 样式
  static const htmlHeader = "<head><meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no'></head>";
  static const css = "<head><style>img{width:100% !important;height:auto}</style></head>";

  /// 安全区域
  static EdgeInsets get safeArea => navKey.currentState?.overlay?.context == null ? EdgeInsets.zero : MediaQuery.of(navKey.currentState!.overlay!.context).padding;

  /// 屏幕宽度
  static double get screenWidth => navKey.currentState?.overlay?.context == null ? 0.0 : MediaQuery.of(navKey.currentState!.overlay!.context).size.width;

  /// 屏幕高度
  static double get screenHeight => navKey.currentState?.overlay?.context == null ? 0.0 : MediaQuery.of(navKey.currentState!.overlay!.context).size.height;

  /// 屏幕size
  static Size get screenSize => navKey.currentState?.overlay?.context == null ? Size.zero : MediaQuery.of(navKey.currentState!.overlay!.context).size;


  /// 导航栏高度
  static double get navBarHeight => kToolbarHeight;

  /// 获取widget所在位置，即偏移的X值
  /// 如果有AppBar 这个值会包含（状态栏 + appBar的高度）
  static double getWidgetX(GlobalKey key) {
    if (key.currentContext == null) {
      return 0;
    }
    var renderBox = key.currentContext!.findRenderObject() as RenderBox;
    double dx = renderBox.localToGlobal(Offset.zero).dx;
    return dx;
  }

  /// 获取widget所在位置，即偏移的Y值
  /// 如果有AppBar 这个值会包含（状态栏 + appBar的高度）
  static double getWidgetY(GlobalKey key) {
    if (key.currentContext == null) {
      return 0;
    }
    var renderBox = key.currentContext!.findRenderObject() as RenderBox;
    double dy = renderBox.localToGlobal(Offset.zero).dy;
    return dy;
  }

  /// 获取widget的宽
  static double getWidgetWidth(GlobalKey key) {
    if (key.currentContext == null) {
      return 0;
    }
    var renderBox = key.currentContext!.findRenderObject() as RenderBox;
    return renderBox.size.width;
  }

  /// 获取widget的高
  static double getWidgetHeight(GlobalKey key) {
    if (key.currentContext == null) {
      return 0;
    }
    var renderBox = key.currentContext!.findRenderObject() as RenderBox;
    return renderBox.size.height;
  }
}