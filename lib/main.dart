import 'package:ecommerce_shopping_project/ui/screens/filters_screen.dart';
import 'package:ecommerce_shopping_project/ui/widgets/dark_mode_transition/dark_sample.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_shopping_project/ui/screens/login.dart';
import 'package:ecommerce_shopping_project/ui/screens/onboarding_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/splash_screen.dart';
import 'package:ecommerce_shopping_project/utilities/screen_util_setup.dart';

void main() {
  runApp(const RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilSetup(
      // homeScreen: DarkSample(),
      // homeScreen: SplashScreen(),
      // homeScreen: OnboardingScreen(),
      homeScreen: Login(),
      // homeScreen: FiltersScreen(),
    );
  }
}
