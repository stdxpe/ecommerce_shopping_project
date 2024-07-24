import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class FiltersScreenBrand extends StatefulWidget {
  const FiltersScreenBrand({
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
  State<FiltersScreenBrand> createState() => _FiltersScreenBrandState();
}

class _FiltersScreenBrandState extends State<FiltersScreenBrand> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Align(
      child: Column(
        children: [
          GestureDetector(
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
                color: context.colorPalette.scaffoldBackground,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextCustom(
                    text: widget.text,
                    textStyle: context.textTheme.displaySmall!,
                    color: isSelected
                        ? ColorPalette.textButtonGreen
                        : context.colorPalette.text.withOpacity(0.6),
                    fontWeightCustom:
                        isSelected ? FontWeight.w500 : FontWeight.w500,
                    fontLetterSpacingCustom: 0.1,
                  ),
                  Icon(
                    Icons.check,
                    size: 40.h,
                    color: isSelected
                        ? context.colorPalette.text
                        : Colors.transparent,
                  ),
                ],
              ),
            ),
          ),
          Divider(
            indent: 35.w,
            endIndent: 35.w,
            height: 0,
            thickness: 0.35,
            color: context.colorPalette.text.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
