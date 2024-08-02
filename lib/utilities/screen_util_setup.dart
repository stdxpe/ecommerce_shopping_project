import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ScreenUtilSetup extends StatelessWidget {
  const ScreenUtilSetup({super.key, required this.homeScreen});

  final Widget homeScreen;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1179, 2556),

      /// TODO: Here
      enableScaleText: () => true,
      minTextAdapt: true,
      ensureScreenSize: true,
      builder: (_, child) {
        return MaterialApp(
          // useInheritedMediaQuery: true,
          title: 'ECommerce Shopping Project',
          // debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          home: child,
        );
      },
      child: homeScreen,
    );
  }
}
