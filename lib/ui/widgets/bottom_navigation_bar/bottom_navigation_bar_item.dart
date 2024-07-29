import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import 'package:ecommerce_shopping_project/ui/screens/discover_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/home_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/profile_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/shopping_cart_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/wishlist_screen.dart';
import 'package:ecommerce_shopping_project/utilities/route_navigation_settings.dart';

class CustomBottomNavigationBarItem {
  PersistentBottomNavBarItem buildItems({
    required String title,
    required Widget icon,
    required Color activeColor,
    required Color inactiveColor,
  }) {
    return PersistentBottomNavBarItem(
      icon: icon,
      title: title,
      activeColorPrimary: activeColor,
      inactiveColorPrimary: inactiveColor,
      routeAndNavigatorSettings: routeAndNavigatorSettings,
      // RouteAndNavigatorSettings(
      //   initialRoute: "/",
      //   routes: {
      //     "/first": (final context) => HomeScreen(onPressed: () {}),
      //     "/second": (final context) => const DiscoverScreen(),
      //     "/third": (final context) => const ShoppingCartScreen(),
      //     "/fourth": (final context) => const WishlistScreen(),
      //     "/fifth": (final context) => const ProfileScreen(),
      //   },
      // ),
    );
  }
}
