import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/theme_mode_provider.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class AppConfiguration extends ConsumerWidget {
  const AppConfiguration({super.key, required this.homeScreen});

  final Widget homeScreen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(1179, 2556),
      enableScaleText: () => false,
      minTextAdapt: true,
      ensureScreenSize: true,
      builder: (_, screenUtilChild) {
        return MaterialApp.router(
          routerConfig: ref.watch(goRouterProvider),
          title: 'ECommerce Shopping Project',
          debugShowCheckedModeBanner: false,
          themeMode: ref.watch(themeModeProvider),
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
        );
      },
      child: homeScreen,
    );
  }
}
