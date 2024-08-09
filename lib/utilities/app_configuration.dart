import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/theme_mode_provider.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class AppConfiguration extends ConsumerWidget {
  const AppConfiguration({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(1179, 2556),
      enableScaleText: () => false,
      minTextAdapt: true,
      ensureScreenSize: true,
      builder: (_, __) {
        return MaterialApp.router(
          title: 'ECommerce Shopping Project',
          debugShowCheckedModeBanner: false,
          theme: AppThemes.light,
          darkTheme: AppThemes.dark,
          themeMode: ref.watch(themeModeProvider),
          routerConfig: ref.watch(goRouterProvider),
        );
      },
    );
  }
}
