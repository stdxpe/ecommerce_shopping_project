import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class FiltersScreenBrand extends StatelessWidget {
  const FiltersScreenBrand({
    super.key,
    required this.isSelected,
    required this.text,
    this.icon,
    this.height,
  });

  final bool isSelected;
  final String text;
  final IconData? icon;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Column(
        children: [
          Container(
            height: height?.h ?? 90.h,
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            decoration: BoxDecoration(
              color: context.colorPalette.scaffoldBackground,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextCustom(
                  text: text,
                  textStyle: context.textTheme.displaySmall!,
                  color: isSelected
                      ? ColorPalette.textButtonGreen
                      : context.colorPalette.text.withOpacity(0.6),
                  fontWeightCustom:
                      isSelected ? FontWeight.w500 : FontWeight.w500,
                  fontLetterSpacingCustom: 0.1,
                ),
                SizedBox(
                  height: 40.h,
                  width: 40.h,
                  child: Icon(
                    Icons.check,
                    size: 40.h,
                    color: isSelected
                        ? context.colorPalette.text
                        : Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            indent: 20.w,
            endIndent: 20.w,
            height: 0,
            thickness: 0.35,
            color: context.colorPalette.text.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
