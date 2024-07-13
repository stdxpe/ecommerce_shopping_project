import 'package:flutter/material.dart';

import 'package:ecommerce_shopping_project/utilities/screen_util_setup.dart';
import 'package:ecommerce_shopping_project/ui/widgets/dark_mode_transition/dark_sample.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilSetup(
      homeScreen: DarkSample(),
    );
  }
}
