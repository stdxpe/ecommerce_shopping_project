import 'package:flutter/material.dart';

import 'utilities/utilities_library_imports.dart';
import 'package:ecommerce_shopping_project/ui/widgets/dark_mode_transition/dark_sample.dart';
import 'package:ecommerce_shopping_project/utilities/screen_util_setup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilSetup(
      materialApp: MaterialApp(
        title: 'ECommerce Shopping Project',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        home: DarkSample(),
      ),
    );
  }
}
