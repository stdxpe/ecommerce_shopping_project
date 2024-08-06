/// TODO: Delete
// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/services/dummy_data/dummy_product_short_list.dart';
import 'package:ecommerce_shopping_project/services/dummy_data/dummy_all_products.dart';
import 'package:ecommerce_shopping_project/services/dependency_injection_service.dart';
import 'package:ecommerce_shopping_project/ui/screens/collection_details_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/credit_cards_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/discover_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/filters_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/forgot_password_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/home_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/main_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/onboarding_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/orders_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/payment_screen_payment.dart';
import 'package:ecommerce_shopping_project/ui/screens/payment_screen_result.dart';
import 'package:ecommerce_shopping_project/ui/screens/payment_screen_shipping.dart';
import 'package:ecommerce_shopping_project/ui/screens/payment_screen_summary.dart';
import 'package:ecommerce_shopping_project/ui/screens/product_details_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/profile_edit_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/profile_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/reviews_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/search_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/shipping_addresses_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/shopping_cart_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/sign_in_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/sign_up_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/splash_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/tracking_order_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/verification_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/wishlist_screen.dart';
import 'package:ecommerce_shopping_project/ui/test_screens/text_animations_screen.dart';
import 'package:ecommerce_shopping_project/ui/test_screens/credit_card_raw_spin_animation.dart';
import 'package:ecommerce_shopping_project/ui/test_screens/dialog_popup_main_alert_dialog.dart';
import 'package:ecommerce_shopping_project/ui/widgets/bottom_sheets/bottom_sheet_feature_selector.dart';
import 'package:ecommerce_shopping_project/ui/widgets/dark_mode_transition/dark_sample.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/background_credit_cards_slider.dart';
import 'package:ecommerce_shopping_project/utilities/app_configuration.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

void main() {
  dependencyInjectionGetItSetup();
  runApp(
    ProviderScope(
      child: const RootApp(),
    ),
  );
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppConfiguration(
      homeScreen: SplashScreen(),
      // homeScreen: OnboardingScreen(),
      // homeScreen: SignInScreen(),
      // homeScreen: SignUpScreen(),
      // homeScreen: ForgotPasswordScreen(),
      // homeScreen: VerificationScreen(),

      // homeScreen: TestAnimationsScreen(),
      // homeScreen: MainScreen(),
      // homeScreen: HomeScreen(onPressed: () {}),
      // homeScreen: ProductDetailsScreen(product: dummyProductShortList[0]),
      // homeScreen: ReviewsScreen(product: dummyProductShortList[0]),
      // homeScreen: DiscoverScreen(),
      // homeScreen: CollectionDetailsScreen(product: dummyProducts[1]),
      // // // homeScreen: WishlistScreen(),
      // homeScreen: ShoppingCartScreen(),
      // homeScreen: PaymentScreenPageview(),
      // homeScreen: SearchScreen(),

      // homeScreen: FiltersScreen(),
      // homeScreen: BottomSheetFeatureSelector(),
      // homeScreen: TestScreen(),
      // homeScreen: TestingScreen(),
      // homeScreen: BackgroundChangerCreditCardsSlider(),
      // homeScreen: ShimmerScreen(),
      // homeScreen: AnimationScreen(),
      // homeScreen: AnimationScreen2(),

      // homeScreen: DarkSample(),
      // homeScreen: ProfileScreen(),
      // homeScreen: OrdersScreen(),
      // homeScreen: TrackingOrderScreen(),
      // homeScreen: ShippingAddressesScreen(),
      // homeScreen: CreditCardsScreen(),
      // homeScreen: ProfileEditScreen(onPressed: () {}),

// Loading bars
// https://pub.dev/packages/loading_animation_widget
// https://pub.dev/packages/pinput

      /// 'Your wishlist/cart is empty' widget
      /// All riverpod's starts at appstart
      /// Eth will be in Collections. getCollection(id?)
      /// TODO: Address and Credit Card model classes
      /// TODO: Search functionality
      /// TODO: Bottom Sheet functionality
      /// TODO: TEXTFIELDS and Regex Validations
      /// TODO: Video BG Splash Screen
      /// TODO: Locally Cached Products will be in the Initial Data of Complex Providers or Dummys?
    );
  }
}
