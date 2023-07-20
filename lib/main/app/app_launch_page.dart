import 'package:flutter/cupertino.dart';
import 'package:flutter_youniu_app/main/app/app_home_page.dart';

class AppLaunchPage extends StatefulWidget {
  const AppLaunchPage({super.key});

  @override
  State<AppLaunchPage> createState() => _AppLaunchPageState();
}

class _AppLaunchPageState extends State<AppLaunchPage> {
  @override
  Widget build(BuildContext context) {
    return const AppHomePage();
  }
}
