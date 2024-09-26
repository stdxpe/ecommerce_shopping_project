import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/theme_mode_provider.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class RootApp extends ConsumerWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      /// ScreenUtil Implemented for Responsive/Adaptive Design with Raw Figma Sizes
      designSize: const Size(
        Constants.kRawFigmaDesignWidth,
        Constants.kRawFigmaDesignHeight,
      ),
      enableScaleText: () => false,
      minTextAdapt: true,
      ensureScreenSize: true,
      builder: (_, __) {
        return MaterialApp.router(
          title: AppStrings.projectName,
          debugShowCheckedModeBanner: false,
          theme: AppThemes.light,
          darkTheme: AppThemes.dark,
          themeMode: ref.watch(themeMode),

          /// Go_Router Implemented as Advanced Navigation Solution
          routerConfig: ref.watch(goRouterProvider),
        );
      },
    );
  }
}
