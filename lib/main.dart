import 'package:flutter/material.dart';
import 'utilities/utilities_library_imports.dart';

import 'package:ecommerce_shopping_project/utilities/dark_sample.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ECommerce Shopping Project',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: DarkSample(),
    );
  }
}
