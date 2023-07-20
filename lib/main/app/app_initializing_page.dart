import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppInitializingPage extends StatelessWidget {
  const AppInitializingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.red, Colors.blue])),
      child: const Center(
        child: CupertinoActivityIndicator(color: Colors.white),
      ),
    );
  }
}
