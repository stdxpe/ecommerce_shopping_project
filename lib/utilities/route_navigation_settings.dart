import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import 'package:ecommerce_shopping_project/ui/screens/discover_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/home_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/profile_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/search_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/shopping_cart_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/wishlist_screen.dart';

RouteAndNavigatorSettings routeAndNavigatorSettings = RouteAndNavigatorSettings(
  initialRoute: "/home",
  routes: {
    "/home": (final context) => HomeScreen(onPressed: () {}),
    "/discover": (final context) => const DiscoverScreen(),
    "/shoppingcart": (final context) => const ShoppingCartScreen(),
    "/wishlist": (final context) => const WishlistScreen(),
    "/profile": (final context) => const ProfileScreen(),
    "/search": (final context) => const SearchScreen(),
  },
);
