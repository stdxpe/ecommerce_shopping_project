/// TODO: Delete
// ignore_for_file: unused_import

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:ecommerce_shopping_project/models/dummy_product_short_list.dart';
import 'package:ecommerce_shopping_project/ui/screens/collection_details_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/discover_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/filters_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/home_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/onboarding_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/payment_screen_pageview.dart';
import 'package:ecommerce_shopping_project/ui/screens/payment_screen_payment.dart';
import 'package:ecommerce_shopping_project/ui/screens/payment_screen_result.dart';
import 'package:ecommerce_shopping_project/ui/screens/payment_screen_shipping.dart';
import 'package:ecommerce_shopping_project/ui/screens/payment_screen_summary.dart';
import 'package:ecommerce_shopping_project/ui/screens/product_details_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/profile_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/reviews_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/search_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/shopping_cart_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/sign_in_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/sign_up_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/splash_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/test_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/wishlist_screen.dart';
import 'package:ecommerce_shopping_project/ui/widgets/%20bottom_sheets/bottom_sheet_feature_selector.dart';
import 'package:ecommerce_shopping_project/ui/widgets/dark_mode_transition/dark_sample.dart';
import 'package:ecommerce_shopping_project/utilities/screen_util_setup.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

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

// Loading bars
// https://pub.dev/packages/loading_animation_widget
  @override
  Widget build(BuildContext context) {
    return ScreenUtilSetup(
      // homeScreen: DarkSample(),
      // homeScreen: SplashScreen(),
      // homeScreen: OnboardingScreen(),
      // homeScreen: SignInScreen(),
      homeScreen: SignUpScreen(),

      // homeScreen: HomeScreen(),
      // homeScreen: ProductDetailsScreen(
      //   product: dummyProductShortList[0],
      // ),
      // homeScreen: ReviewsScreen(product: dummyProductShortList[0]),
      // homeScreen: DiscoverScreen(),
      // homeScreen:
      //     CollectionDetailsScreen(product: dummyDealsOfTheWeekProductList[1]),
      // homeScreen: WishlistScreen(),
      // homeScreen: ShoppingCartScreen(),
      // homeScreen: PaymentScreenPageview(),
      // homeScreen: SearchScreen(),

      // homeScreen: ProfileScreen(),
      // homeScreen: FiltersScreen(),
      // homeScreen: BottomSheetFeatureSelector(),
      // homeScreen: TestScreen(),
    );
  }
}
