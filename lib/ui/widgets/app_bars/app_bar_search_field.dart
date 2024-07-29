import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/textformfield_search_box.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class AppBarSearchField extends StatelessWidget implements PreferredSizeWidget {
  const AppBarSearchField({
    super.key,
    required this.searchOnPressed,
  });

  final Function() searchOnPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.colorPalette.appBarBackground,
      foregroundColor: context.colorPalette.appBarForeground,
      surfaceTintColor: context.colorPalette.appBarBackground,
      titleSpacing: 0,
      iconTheme: IconThemeData(
        color: context.colorPalette.appBarForeground,
        size: 60.h,
      ),
      automaticallyImplyLeading: true,
      title: Row(
        children: [
          // IconButton(
          //   alignment: Alignment.centerLeft,
          //   onPressed: () {
          //     Navigator.of(context).pop();
          //   },
          //   icon: const Icon(
          //     CupertinoIcons.back,
          //   ),
          // ),
          const Expanded(
            child: TextformfieldSearchBox(
              text: AppStrings.searchScreenSearchBoxTextfieldHintText,
              autoFocus: true,
              lineColor: Colors.transparent,
              paddingHorizontal: 0,
            ),
          ),
          IconButton(
            alignment: Alignment.center,
            onPressed: () {
              searchOnPressed();
            },
            icon: const Icon(CupertinoIcons.search),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(120.h);
  // Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
