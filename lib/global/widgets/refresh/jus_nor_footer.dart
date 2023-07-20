import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class JusNorFooter extends StatelessWidget {
  const JusNorFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return ClassicFooter(
      loadingIcon: SizedBox(
        width: 16.r,
        height: 16.r,
        child: defaultTargetPlatform == TargetPlatform.iOS ? const CupertinoActivityIndicator() : const CircularProgressIndicator(strokeWidth: 3.0),
      ),
    );
  }
}
