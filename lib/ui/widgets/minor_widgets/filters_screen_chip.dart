import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class FiltersScreenChip extends StatefulWidget {
  const FiltersScreenChip({
    super.key,
    required this.onPressed,
    required this.text,
    this.icon,
    this.height,
  });

  final Function() onPressed;
  final String text;
  final IconData? icon;
  final double? height;

  @override
  State<FiltersScreenChip> createState() => _FiltersScreenChipState();
}

class _FiltersScreenChipState extends State<FiltersScreenChip> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Align(
      child: GestureDetector(
        onTap: () {
          setState(() {
            widget.onPressed();
            isSelected = !isSelected;
          });
        },
        child: Container(
          height: widget.height?.h ?? 90.h,
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
                if (widget.icon != null)
                  Icon(
                    widget.icon!,
                    size: 40.h,
                    color: isSelected
                        ? context.colorPalette.scaffoldBackground
                        : context.colorPalette.text,
                  ),
                if (widget.icon != null) SizedBox(width: 25.w),
                TextCustom(
                  text: widget.text,
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
      ),
    );
  }
}
