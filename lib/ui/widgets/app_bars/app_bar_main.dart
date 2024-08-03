import 'package:ecommerce_shopping_project/app_router.dart';
import 'package:ecommerce_shopping_project/services/dependency_injection_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:unicons/unicons.dart';

import 'package:ecommerce_shopping_project/ui/screens/search_screen.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class AppBarMain extends StatelessWidget implements PreferredSizeWidget {
  const AppBarMain({
    super.key,
    this.automaticallyImplyLeading = false,
    this.onPressedBackButtonAlternate,
    this.useShadow = false,
    this.useTitle = false,
    this.useSearchButton = true,
  });

  final bool? automaticallyImplyLeading;
  final bool? useShadow;
  final bool? useTitle;
  final bool? useSearchButton;
  final Function()? onPressedBackButtonAlternate;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.colorPalette.appBarBackground,
      foregroundColor: context.colorPalette.appBarForeground,
      surfaceTintColor: context.colorPalette.appBarBackground,
      iconTheme: IconThemeData(
        color: context.colorPalette.appBarForeground,
        size: 60.h,
      ),
      automaticallyImplyLeading: false,
      leading: automaticallyImplyLeading!
          ? IconButton(
              icon: const Icon(CupertinoIcons.back),
              alignment: Alignment.center,
              onPressed: () {
                (onPressedBackButtonAlternate == null)
                    ? context.pop()
                    : onPressedBackButtonAlternate!();
              },
            )
          : null,
      actions: [
        if (useSearchButton == true)
          IconButton(
            icon: const Icon(UniconsLine.search),
            alignment: Alignment.center,
            onPressed: () {
              context.go(Routes.search);
            },
          ),
      ],
      elevation: (useShadow == true) ? 10 : 0,
      shadowColor: (useShadow == true)
          ? context.colorPalette.shadowPrimary
          : Colors.transparent,
      centerTitle: false,
      title: useTitle == true
          ? TextCustom(
              text: AppStrings.appTitle,
              color: context.colorPalette.title,
              textStyle: context.textTheme.headlineLarge!,
              fontSizeCustom: 70,
              fontLetterSpacingCustom: 1.5,
              fontWeightCustom: FontWeight.w700,
              fontHeightCustom: 1,
            )
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(120.h);
  // Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
