import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import 'package:ecommerce_shopping_project/ui/screens/discover_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/home_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/profile_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/shopping_cart_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/wishlist_screen.dart';
import 'package:ecommerce_shopping_project/ui/widgets/bottom_navigation_bar/bottom_navigation_bar_item.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  //  https://pub.dev/packages/persistent_bottom_nav_bar#custom-navigation-bar-styling

  @override
  Widget build(BuildContext context) {
    PersistentTabController controller;
    controller = PersistentTabController(initialIndex: 0);

    List<Widget> buildScreens() {
      return [
        HomeScreen(onPressed: () {}),
        const DiscoverScreen(),
        const ShoppingCartScreen(),
        const WishlistScreen(),
        const ProfileScreen(),
      ];
    }

    List<PersistentBottomNavBarItem> navBarsItems() {
      return [
        CustomBottomNavigationBarItem().buildItems(
          title: AppStrings.bottomNavBarHome,
          icon: const Icon(CupertinoIcons.home),
          activeColor: context.colorPalette.navigationBarActive,
          inactiveColor: context.colorPalette.navigationBarPassive,
        ),
        CustomBottomNavigationBarItem().buildItems(
          title: AppStrings.bottomNavBarDiscover,
          icon: const Icon(CupertinoIcons.search),
          activeColor: context.colorPalette.navigationBarActive,
          inactiveColor: context.colorPalette.navigationBarPassive,
        ),
        CustomBottomNavigationBarItem().buildItems(
          title: AppStrings.bottomNavBarCart,
          icon: const Icon(CupertinoIcons.cart),
          activeColor: context.colorPalette.navigationBarActive,
          inactiveColor: context.colorPalette.navigationBarPassive,
        ),
        CustomBottomNavigationBarItem().buildItems(
          title: AppStrings.bottomNavBarWishlist,
          icon: const Icon(CupertinoIcons.heart),
          activeColor: context.colorPalette.navigationBarActive,
          inactiveColor: context.colorPalette.navigationBarPassive,
        ),
        CustomBottomNavigationBarItem().buildItems(
          title: AppStrings.bottomNavBarProfile,
          icon: const Icon(CupertinoIcons.person),
          activeColor: context.colorPalette.navigationBarActive,
          inactiveColor: context.colorPalette.navigationBarPassive,
        ),
      ];
    }

    return PersistentTabView(
      backgroundColor: context.colorPalette.navigationBarBackground,
      context,
      controller: controller,
      screens: buildScreens(),
      items: navBarsItems(),
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardAppears: true,
      // popBehaviorOnSelectedNavBarItemPress: PopActionScreensType.all,
      padding: const EdgeInsets.only(top: 0),
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          duration: Duration(milliseconds: 300),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
      ),

      // confineToSafeArea: false,
      // navBarHeight: 150.h,
      navBarHeight: kBottomNavigationBarHeight,
      navBarStyle:
          // NavBarStyle.style3, // Choose the nav bar style with this property
          NavBarStyle.style12, // Choose the nav bar style with this property
    );
  }
}
