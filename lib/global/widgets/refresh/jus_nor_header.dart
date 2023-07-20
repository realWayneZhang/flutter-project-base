import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class JusNorHeader extends StatelessWidget {
  const JusNorHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ClassicHeader(
      refreshingIcon: SizedBox(
        width: 16.r,
        height: 16.r,
        child: defaultTargetPlatform == TargetPlatform.iOS ? const CupertinoActivityIndicator() : const CircularProgressIndicator(strokeWidth: 3.0),
      ),
    );
  }
}
