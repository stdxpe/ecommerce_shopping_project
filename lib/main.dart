/// TODO: Delete
// ignore_for_file: unused_import

import 'package:device_preview/device_preview.dart';
import 'package:ecommerce_shopping_project/models/dummy_product_short_list.dart';
import 'package:ecommerce_shopping_project/ui/screens/collection_details_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/product_details_screen.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_shopping_project/ui/screens/filters.dart';
import 'package:ecommerce_shopping_project/ui/screens/home_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/login.dart';
import 'package:ecommerce_shopping_project/ui/screens/onboarding_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/profile_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/search_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/shopping_cart_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/splash_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/wishlist_screen.dart';
import 'package:ecommerce_shopping_project/ui/widgets/dark_mode_transition/dark_sample.dart';
import 'package:ecommerce_shopping_project/utilities/screen_util_setup.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    DevicePreview(
      // enabled: true, //!kReleaseMode,
      enabled: false, //!kReleaseMode,
      builder: (context) => const RootApp(), // Wrap your app
    ),
  );
  // runApp(const RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilSetup(
      // homeScreen: DarkSample(),
      // homeScreen: SplashScreen(),
      // homeScreen: OnboardingScreen(),
      // homeScreen: HomeScreen(),
      homeScreen: ProductDetailsScreen(
        product: dummyProductShortList[0],
      ),
      // homeScreen: CollectionDetailsScreen(
      //   product: dummyDealsOfTheWeekProductList[1],
      // ),
      // homeScreen: WishlistScreen(),
      // homeScreen: ShoppingCartScreen(),
      // homeScreen: ProfileScreen(),
      // homeScreen: Login(),
      // homeScreen: FiltersScreen(),
      // homeScreen: SearchScreen(),
    );
  }
}
