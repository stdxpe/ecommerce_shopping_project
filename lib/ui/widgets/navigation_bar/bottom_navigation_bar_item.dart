import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import 'package:ecommerce_shopping_project/utilities/route_navigation_settings.dart';

class CustomBottomNavigationBarItem {
  PersistentBottomNavBarItem buildItems({
    required String title,
    required Widget icon,
    required Color activeColor,
    required Color inactiveColor,
    bool? withNavBar = true,
    Function? onPressed,
  }) {
    return PersistentBottomNavBarItem(
      icon: icon,
      title: title,
      activeColorPrimary: activeColor,
      inactiveColorPrimary: inactiveColor,
      routeAndNavigatorSettings: routeAndNavigatorSettings,
      onPressed: (withNavBar == false)
          ? (ctx) {
              onPressed!();
            }
          : null,
    );
  }
}
