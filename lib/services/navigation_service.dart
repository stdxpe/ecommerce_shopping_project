import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/ui/screens/main_screen.dart';
import 'package:ecommerce_shopping_project/models/collection.dart';
import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/ui/screens/collection_details_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/credit_cards_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/discover_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/forgot_password_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/home_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/orders_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/payment_screen_pageview.dart';
import 'package:ecommerce_shopping_project/ui/screens/product_details_screen.dart';
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
import 'package:ecommerce_shopping_project/ui/test_screens/test_animations_screen.dart';

class Routes {
  Routes._();

  static const String root = '/';
  static const String test = '/test';
  // static const String main = '/main';

  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String signIn = '/signIn';
  static const String signUp = '/signUp';
  static const String verification = '/verification';
  static const String forgotPassword = '/forgotPassword';

  /// Bottom Navigation Bar Tabs
  static const String home = '/home';
  static const String discover = '/discover';
  static const String shoppingCart = '/shoppingCart';
  static const String wishlist = '/wishlist';
  static const String profile = '/profile';

  /// Discover Tab Nested Navigation Stack
  static const String search = '/discover/search';

  /// Shopping Cart Tab Nested Navigation Stack
  static const String payment = '/payment';
  static const String paymentShipping = '/paymentShipping';
  static const String paymentPayment = '/paymentPayment';
  static const String paymentSummary = '/paymentSummary';
  static const String paymentResult = '/paymentResult';

  /// Profile Tab Nested Navigation Stack
  static const String profileEdit = '/profileEdit';
  static const String orders = '/profile/orders';
  static const String trackingOrder = '/profile/orders/trackingOrder';
  static const String shippingAddresses = '/profile/shippingAddresses';
  static const String creditCards = '/profile/creditCards';

  /// Global Navigations with No Nav-Bar
  static const String productDetails = '/productDetails';
  static const String reviews = '/productDetails/reviews';
  static const String collectionDetails = '/collectionDetails';

  /// Dialog Popups and Bottom Sheets with No Nav-Bar
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

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: Routes.home,
    // errorBuilder: (context, state) => 404Screen(),
    // initialLocation: Routes.test,

    // redirect: (context, state) {
    //   bool userAuthenticated = true;

    //   /// TODO: AuthProvider Riverpod
    //   /// state.matchedLocation ?? https://www.youtube.com/watch?v=rxB4ena16Rk&t=616s
    //   return (userAuthenticated) ? Routes.home : null;
    // },

    /// TODO: OnWillPop behaviors test
    routes: [
      /// TESTING WIDGET ROUTE TEMP
      GoRoute(
          path: Routes.test,
          builder: (context, state) => TestAnimationsScreen()),
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
      // StatefulShellRoute.indexedStack(
      ///TEST
      StatefulShellRoute(
        parentNavigatorKey: rootNavigatorKey,
        builder: (BuildContext context, GoRouterState state,
            StatefulNavigationShell navigationShell) {
          return navigationShell;
        },
        navigatorContainerBuilder: (BuildContext context,
            StatefulNavigationShell navigationShell, List<Widget> children) {
          return MainScreen(
              navigationShell: navigationShell, children: children);
        },
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
                      builder: (context, state) => const SearchScreen(),
                    ),
                  ]),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: shoppingCartNavigatorKey,
            routes: <RouteBase>[
              GoRoute(
                  parentNavigatorKey: shoppingCartNavigatorKey,
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
                  builder: (context, state) => const ProfileScreen(),
                  routes: [
                    GoRoute(
                        parentNavigatorKey: profileNavigatorKey,
                        path: 'orders',
                        builder: (context, state) => const OrdersScreen(),
                        routes: [
                          GoRoute(
                              parentNavigatorKey: profileNavigatorKey,
                              path: 'trackingOrder',
                              builder: (context, state) =>
                                  const TrackingOrderScreen()),
                        ]),
                    GoRoute(
                        parentNavigatorKey: profileNavigatorKey,
                        path: 'shippingAddresses',
                        builder: (context, state) =>
                            const ShippingAddressesScreen()),
                    GoRoute(
                        parentNavigatorKey: profileNavigatorKey,
                        path: 'creditCards',
                        builder: (context, state) => const CreditCardsScreen()),
                  ]),
            ],
          ),
        ],
      ),
      GoRoute(
          path: Routes.payment,
          builder: (context, state) => const PaymentScreenPageview()),
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
      GoRoute(
          path: Routes.collectionDetails,
          builder: (context, state) {
            return CollectionDetailsScreen(
              collection: state.extra! as Collection,
            );
          }),
    ],
  );
});


/// Custom Transition Builder for go_router package if necessary
//  GoRoute(
//         path: Routes.payment,
//         pageBuilder: (context, state) {
//           return CustomTransitionPage<void>(
//             key: state.pageKey,
//             child: const PaymentScreenPageview(),
//             transitionsBuilder:
//                 (context, animation, secondaryAnimation, child) =>
//                     SlideTransition(
//                         position: animation.drive(
//                           Tween<Offset>(
//                             begin: const Offset(0, 1),
//                             end: Offset.zero,
//                           ).chain(CurveTween(curve: Curves.easeIn)),
//                         ),
//                         child: child),
//           );
//         },