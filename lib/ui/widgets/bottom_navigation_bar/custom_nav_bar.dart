import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/bottom_navigation_bar/custom_nav_bar_item.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
    required this.onPressed,
    required this.currentIndex,
  });

  final Function(int index) onPressed;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      /// Uncomment for Horizontal Padding of BottomNavBar
      // padding: EdgeInsets.symmetric(horizontal: 25.w),
      height: 275.h,
      width: context.mediaQuery.size.width,
      decoration: BoxDecoration(
        color: context.colorPalette.navigationBarBackground,
        boxShadow: [
          BoxShadows.kBoxShadowBottomSheet(
              color: context.colorPalette.shadowSecondary)
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomNavBarItem(
            onPressed: onPressed,
            currentIndex: currentIndex,
            buttonIndex: 0,
            icon: UniconsLine.home_alt,
          ),
          CustomNavBarItem(
            onPressed: onPressed,
            currentIndex: currentIndex,
            buttonIndex: 1,
            icon: UniconsLine.search,
          ),
          CustomNavBarItem(
            onPressed: onPressed,
            currentIndex: currentIndex,
            buttonIndex: 2,
            icon: Icons.shopping_cart_outlined,
          ),
          CustomNavBarItem(
            onPressed: onPressed,
            currentIndex: currentIndex,
            buttonIndex: 3,
            icon: UniconsLine.heart,
          ),
          CustomNavBarItem(
            onPressed: onPressed,
            currentIndex: currentIndex,
            buttonIndex: 4,
            icon: UniconsLine.user,
          ),
        ],
      ),
    );
  }
}
