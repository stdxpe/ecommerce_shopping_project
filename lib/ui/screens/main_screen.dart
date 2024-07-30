import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:unicons/unicons.dart';

import 'package:ecommerce_shopping_project/ui/screens/discover_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/home_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/shopping_cart_screen.dart';
import 'package:ecommerce_shopping_project/ui/screens/wishlist_screen.dart';
import 'package:ecommerce_shopping_project/ui/widgets/bottom_navigation_bar/bottom_navigation_bar_item.dart';
import 'package:ecommerce_shopping_project/ui/widgets/dark_mode_transition/dark_sample.dart';
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
        // const ProfileScreen(),
        /// TODO: Dark Mode mess here?
        DarkSample(),
      ];
    }

    List<PersistentBottomNavBarItem> navBarsItems() {
      return [
        CustomBottomNavigationBarItem().buildItems(
          title: AppStrings.bottomNavBarHome,
          icon: const Icon(UniconsLine.home_alt),
          activeColor: context.colorPalette.navigationBarActive,
          inactiveColor: context.colorPalette.navigationBarPassive,
        ),
        CustomBottomNavigationBarItem().buildItems(
          title: AppStrings.bottomNavBarDiscover,
          icon: const Icon(UniconsLine.search),
          activeColor: context.colorPalette.navigationBarActive,
          inactiveColor: context.colorPalette.navigationBarPassive,
        ),
        CustomBottomNavigationBarItem().buildItems(
          title: AppStrings.bottomNavBarCart,
          icon: const Icon(Icons.shopping_cart_outlined),
          activeColor: context.colorPalette.navigationBarActive,
          inactiveColor: context.colorPalette.navigationBarPassive,
          withNavBar: false,
          onPressed: () {
            PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: const ShoppingCartScreen(),
              withNavBar: false,
              pageTransitionAnimation: PageTransitionAnimation.fade,
            );
          },
        ),
        CustomBottomNavigationBarItem().buildItems(
          title: AppStrings.bottomNavBarWishlist,
          icon: const Icon(UniconsLine.heart),
          activeColor: context.colorPalette.navigationBarActive,
          inactiveColor: context.colorPalette.navigationBarPassive,
        ),
        CustomBottomNavigationBarItem().buildItems(
          title: AppStrings.bottomNavBarProfile,
          icon: const Icon(UniconsLine.user),
          activeColor: context.colorPalette.navigationBarActive,
          inactiveColor: context.colorPalette.navigationBarPassive,
        ),
      ];
    }

    return PersistentTabView(
      backgroundColor: context.colorPalette.navigationBarBackground,
      decoration: NavBarDecoration(
        boxShadow: [
          BoxShadows.kBoxShadowBottomSheet(
              color: context.colorPalette.shadowSecondary)
        ],
      ),

      context,
      controller: controller,
      screens: buildScreens(),
      items: navBarsItems(),
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardAppears: true,
      popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
      padding: const EdgeInsets.only(top: 0),
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 150),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          duration: Duration(milliseconds: 300),
          screenTransitionAnimationType: ScreenTransitionAnimationType.slide,
        ),
      ),
      // confineToSafeArea: false,
      navBarHeight: kBottomNavigationBarHeight,
      navBarStyle:
          // NavBarStyle.style3, // Choose the nav bar style with this property
          NavBarStyle.style12, // Choose the nav bar style with this property
    );
  }
}
