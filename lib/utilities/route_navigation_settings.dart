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
    // "/home": (context) => HomeScreen(onPressed: () {}),
    "/home": (context) => const HomeScreen(),

    "/discover": (context) => const DiscoverScreen(),
    "/shoppingcart": (context) => const ShoppingCartScreen(),
    "/wishlist": (context) => const WishlistScreen(),
    "/profile": (context) => const ProfileScreen(),
    "/search": (context) => const SearchScreen(),
  },
);
