import 'package:ecommerce_shopping_project/business/i_db_repository.dart';
import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/services/dependency_injection_service.dart';
import 'package:ecommerce_shopping_project/ui/screens/product_details_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/reviews_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/search_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/nav_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/discover_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/forgot_password_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/home_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/profile_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/shopping_cart_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/sign_in_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/sign_up_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/splash_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/verification_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/wishlist_screen.dart';

class Routes {
  Routes._();

  static const String root = '/';

  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String signIn = '/signIn';
  static const String signUp = '/signUp';
  static const String verification = '/verification';
  static const String forgotPassword = '/forgotPassword';

  static const String main = '/main';

  static const String home = '/home';
  static const String discover = '/discover';
  static const String shoppingCart = '/shoppingCart';
  static const String wishlist = '/wishlist';
  static const String profile = '/profile';

  static const String payment = '/payment';
  static const String paymentShipping = '/paymentShipping';
  static const String paymentPayment = '/paymentPayment';
  static const String paymentSummary = '/paymentSummary';
  static const String paymentResult = '/paymentResult';

  static const String productDetails = '/productDetails';
  static const String reviews = '/productDetails/reviews';
  static const String collectionDetails = '/collectionDetails';
  static const String profileEdit = '/profileEdit';
  static const String search = '/discover/search';
  static const String shippingAddresses = '/shippingAddresses';
  static const String creditCards = '/creditCards';
  static const String filters = '/filters';
}

final goRouterProvider = Provider<GoRouter>((ref) {
  final rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'rootNavigatorKey');
  final homeNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'homeNavigatorKey');
  final discoverNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'discoverNavigatorKey');
  final shoppingCartNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'shoppingCartNavigatorKey');
  final wishlistNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'wishlistNavigatorKey');
  final profileNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'profileNavigatorKey');
  final searchNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'searchNavigatorKey');
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    // errorBuilder: (context, state) => 404Screen(),
    initialLocation: Routes.home,
    // redirect: (context, state) {
    //   bool userAuthenticated = true;

    //   /// TODO: AuthProvider Riverpod
    //   /// state.matchedLocation ?? https://www.youtube.com/watch?v=rxB4ena16Rk&t=616s
    //   return (userAuthenticated) ? Routes.home : null;
    // },
    // initialLocation: Routes.home,
    routes: [
      GoRoute(
          path: Routes.splash,
          builder: (context, state) => const SplashScreen()),
      GoRoute(
          path: Routes.signUp,
          builder: (context, state) => const SignUpScreen()),
      GoRoute(
          path: Routes.signIn,
          builder: (context, state) => const SignInScreen()),
      GoRoute(
          path: Routes.verification,
          builder: (context, state) => const VerificationScreen()),
      GoRoute(
          path: Routes.forgotPassword,
          builder: (context, state) => const ForgotPasswordScreen()),
      GoRoute(
          path: Routes.shoppingCart,
          builder: (context, state) => const ShoppingCartScreen()),
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state, navigationShell) =>
            ScaffoldWithNavBar(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            navigatorKey: homeNavigatorKey,
            routes: <RouteBase>[
              GoRoute(
                path: Routes.home,
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: discoverNavigatorKey,
            routes: <RouteBase>[
              GoRoute(
                  parentNavigatorKey: discoverNavigatorKey,
                  path: Routes.discover,
                  builder: (context, state) => const DiscoverScreen(),
                  routes: [
                    GoRoute(
                        parentNavigatorKey: discoverNavigatorKey,
                        path: 'search',
                        builder: (context, state) => const SearchScreen()),
                  ]),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: shoppingCartNavigatorKey,
            routes: <RouteBase>[
              GoRoute(
                  parentNavigatorKey: shoppingCartNavigatorKey,
                  // name: 'shoppingCart',
                  path: Routes.shoppingCart,
                  builder: (context, state) => const ShoppingCartScreen()),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: wishlistNavigatorKey,
            routes: <RouteBase>[
              GoRoute(
                  path: Routes.wishlist,
                  builder: (context, state) => const WishlistScreen()),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: profileNavigatorKey,
            routes: <RouteBase>[
              GoRoute(
                  path: Routes.profile,
                  builder: (context, state) => const ProfileScreen()),
            ],
          ),
        ],
      ),
      GoRoute(
          path: Routes.productDetails,
          builder: (context, state) {
            return ProductDetailsScreen(
              product: state.extra! as Product,
            );
          },
          routes: [
            GoRoute(
                path: 'reviews',
                builder: (context, state) {
                  return ReviewsScreen(
                    product: state.extra! as Product,
                  );
                }),
          ]),
    ],
  );
});
