part of 'app.dart';

// ================================= App 初始化 =============================================

var _launchPage = const AppLaunchPage();
var _initializingPage = const AppInitializingPage();

Widget _createAppScreen(Widget home) {
  return ScreenUtilInit(
    minTextAdapt: true,
    splitScreenMode: true,
    child: home,
    builder: (context, child) {
      return RefreshConfiguration(
        headerBuilder: () => const JusNorHeader(),
        footerBuilder: () => const JusNorFooter(),
        headerTriggerDistance: 80.r,
        springDescription: const SpringDescription(stiffness: 170, damping: 16, mass: 1.9),
        maxOverScrollExtent: 100.r,
        maxUnderScrollExtent: 0,
        enableScrollWhenRefreshCompleted: true,
        enableLoadingWhenFailed: true,
        hideFooterWhenNotFull: false,
        enableBallisticLoad: true,
        child: GetMaterialApp(
          defaultTransition: Transition.cupertino,
          navigatorKey: AppConfig.navKey,
          localizationsDelegates: _localizationsDelegates,
          supportedLocales: _supportedLocales,
          theme: _createTheme(context),
          initialBinding: AppControllerBinding(),
          home: MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          ),
          builder: EasyLoading.init(
            builder: (context, child) {
              JusLoading.config();
              return child!;
            },
          ),
        ),
      );
    },
  );
}

// 国际化代理
var _localizationsDelegates = const <LocalizationsDelegate<dynamic>>[
  RefreshLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate
];

// 国际化 locale
var _supportedLocales = const <Locale>[
  Locale('zh', 'CH'),
  Locale('en', 'US'),
];

/// 主题
ThemeData _createTheme(BuildContext context) {
  return Theme.of(context).copyWith(
    highlightColor: Colors.transparent,
    splashFactory: const NoSplashFactory(),
  );
}

// ================================= 工具初始化 =============================================
Future<bool> _futureInit() async {
  await _preInit();
  return true;
}

// 初始化工具类
Future<List<Object>> _preInit() async {
  return await Future.wait([
    GetStorage.init(), // 持久化
    AppPackageInfo.preInit(),
    AppConfig.instance.init(),
  ]);
}

// ================================= 第三方库始化 =============================================
