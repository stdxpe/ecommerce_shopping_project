import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/buttons/button_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      child: Row(
        children: [
          Expanded(
            child: ButtonMain(
              onPressed: () {},
              text: 'Continue',
              backgroundColor:
                  context.theme.colorPalette.buttonMainBackgroundSecondary,
              foregroundColor:
                  context.theme.colorPalette.buttonMainForegroundSecondary,
              borderWidth: 2,
              useShadow: false,
              paddingHorizontal: 0,
              paddingLeft: 90.w,
            ),
          ),
          SizedBox(width: 30.w),
          Expanded(
            child: ButtonMain(
              onPressed: () {},
              text: 'Enter',
              paddingHorizontal: 0,
              paddingRight: 90.w,
            ),
          ),
        ],
      ),
    );
  }
}
