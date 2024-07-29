import 'package:ecommerce_shopping_project/ui/screens/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarMain extends StatelessWidget implements PreferredSizeWidget {
  const AppBarMain({super.key});

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
      actions: [
        IconButton(
          alignment: Alignment.center,
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => SearchScreen(),
                transitionDuration: const Duration(milliseconds: 1000),
                transitionsBuilder: (_, a, __, c) =>
                    FadeTransition(opacity: a, child: c),
              ),
            );
          },
          icon: const Icon(CupertinoIcons.search),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(120.h);
  // Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
