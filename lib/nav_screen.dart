import 'package:ecommerce_shopping_project/app_router.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unicons/unicons.dart';

/// Builds the "shell" for the app by building a Scaffold with a
/// BottomNavigationBar, where [child] is placed in the body of the Scaffold.
class ScaffoldWithNavBar extends StatelessWidget {
  /// Constructs an [ScaffoldWithNavBar].
  const ScaffoldWithNavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;

  // #docregion configuration-custom-shell
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The StatefulNavigationShell from the associated StatefulShellRoute is
      // directly passed as the body of the Scaffold.
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: context.colorPalette.navigationBarActive,
          unselectedItemColor: context.colorPalette.navigationBarPassive,
          backgroundColor: context.colorPalette.navigationBarBackground,
          // Here, the items of BottomNavigationBar are hard coded. In a real
          // world scenario, the items would most likely be generated from the
          // branches of the shell route, which can be fetched using
          // `navigationShell.route.branches`.
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(UniconsLine.home_alt), label: ''),
            BottomNavigationBarItem(icon: Icon(UniconsLine.search), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined), label: ''),
            BottomNavigationBarItem(icon: Icon(UniconsLine.heart), label: ''),
            BottomNavigationBarItem(icon: Icon(UniconsLine.user), label: ''),
          ],
          currentIndex: navigationShell.currentIndex,

          // Navigate to the current location of the branch at the provided index
          // when tapping an item in the BottomNavigationBar.
          onTap: (int index) {
            if (index == 2) {
              context.push(Routes.shoppingCart);
            } else {
              navigationShell.goBranch(index);
            }
          }),
    );
  }
  // #enddocregion configuration-custom-shell

  /// NOTE: For a slightly more sophisticated branch switching, change the onTap
  /// handler on the BottomNavigationBar above to the following:
  /// `onTap: (int index) => _onTap(context, index),`
  // ignore: unused_element
  void _onTap(BuildContext context, int index) {
    // When navigating to a new branch, it's recommended to use the goBranch
    // method, as doing so makes sure the last navigation state of the
    // Navigator for the branch is restored.
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
