import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:unicons/unicons.dart';

import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
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
    this.useTransparentBackground = false,
    this.appBarHeight = 120,
    this.iconsColor,
  });

  final bool? automaticallyImplyLeading;
  final Color? iconsColor;
  final bool? useShadow;
  final bool? useTitle;
  final bool? useSearchButton;
  final bool? useTransparentBackground;
  final Function()? onPressedBackButtonAlternate;
  final double? appBarHeight;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: useTransparentBackground!
          ? Colors.transparent
          : context.colorPalette.appBarBackground,
      foregroundColor: context.colorPalette.appBarForeground,
      surfaceTintColor: context.colorPalette.appBarBackground,
      iconTheme: IconThemeData(
        color: iconsColor ?? context.colorPalette.appBarForeground,
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
  Size get preferredSize => Size.fromHeight(appBarHeight!.h);
  // Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
