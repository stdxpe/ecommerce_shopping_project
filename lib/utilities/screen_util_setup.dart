import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenUtilSetup extends StatelessWidget {
  const ScreenUtilSetup({super.key, required this.materialApp});

  final Widget materialApp;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1179, 2556),
      builder: (context, child) => materialApp,
    );
  }
}
