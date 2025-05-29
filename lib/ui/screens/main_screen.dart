import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/ui/widgets/bottom_navigation_bar/custom_nav_bar_branch_animation.dart';
import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:ecommerce_shopping_project/ui/widgets/bottom_navigation_bar/custom_nav_bar.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class MainScreen extends StatelessWidget {
  const MainScreen(
      {required this.navigationShell, Key? key, required this.children})
      : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  final StatefulNavigationShell navigationShell;

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorPalette.scaffoldBackground,
      body: CustomNavBarBranchAnimation(
        currentIndex: navigationShell.currentIndex,
        children: children,
      ),
      bottomNavigationBar: CustomNavBar(
        currentIndex: navigationShell.currentIndex,
        onPressed: (index) {
          if (index == 2) {
            context.push(Routes.shoppingCart);
          } else {
            navigationShell.goBranch(
              index,

              /// Delete this optional line if necessary
              initialLocation: index == navigationShell.currentIndex,
            );
          }
        },
      ),
    );
  }
}
