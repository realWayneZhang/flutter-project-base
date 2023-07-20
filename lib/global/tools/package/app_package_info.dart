import 'package:package_info_plus/package_info_plus.dart';

class AppPackageInfo {

  late PackageInfo pf;
  // 单例
  AppPackageInfo._init() {
    init();
  }

  AppPackageInfo._pre(this.pf);

  static AppPackageInfo? _instance;
  static AppPackageInfo get instance {
    _instance ??= AppPackageInfo._init();
    return _instance!;
  }

  ///预初始化，防止在使用get时，prefs还未完成初始化
  static Future<AppPackageInfo> preInit() async {
    if (_instance == null) {
      var pf = await PackageInfo.fromPlatform();
      _instance = AppPackageInfo._pre(pf);
    }
    return _instance!;
  }

  void init() async {
    pf = await PackageInfo.fromPlatform();
  }

  static String get appName  => AppPackageInfo.instance.pf.appName;
  static String get packageName => AppPackageInfo.instance.pf.packageName;
  static String get version => AppPackageInfo.instance.pf.version;
  static String get buildNumber => AppPackageInfo.instance.pf.buildNumber;

}