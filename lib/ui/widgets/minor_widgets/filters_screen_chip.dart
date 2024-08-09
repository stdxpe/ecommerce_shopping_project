import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class FiltersScreenChip extends StatelessWidget {
  const FiltersScreenChip({
    super.key,
    required this.text,
    this.icon,
    this.height,
    required this.isSelected,
  });

  final bool isSelected;
  final String text;
  final IconData? icon;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        height: height?.h ?? 90.h,
        padding: EdgeInsets.symmetric(
          horizontal: 40.w,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? context.colorPalette.text
              : context.colorPalette.scaffoldBackground,
          border: Border.all(color: context.colorPalette.text, width: 1.5),
          borderRadius: BorderRadius.all(
            Radius.circular(Constants.kRadiusChips.r),
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null)
                Icon(
                  icon!,
                  size: 40.h,
                  color: isSelected
                      ? context.colorPalette.scaffoldBackground
                      : context.colorPalette.text,
                ),
              if (icon != null) SizedBox(width: 25.w),
              TextCustom(
                text: text,
                textStyle: context.textTheme.displaySmall!,
                color: isSelected
                    ? context.colorPalette.scaffoldBackground
                    : context.colorPalette.text,
                fontWeightCustom: FontWeight.w600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
