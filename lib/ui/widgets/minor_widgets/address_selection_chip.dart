import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class AddressSelectionChip extends StatelessWidget {
  const AddressSelectionChip({
    super.key,
    required this.text,
    required this.height,
    required this.isSelected,
  });

  final bool isSelected;
  final String text;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        height: height,
        padding: EdgeInsets.symmetric(horizontal: 75.w),
        decoration: BoxDecoration(
            color: isSelected
                ? context.colorPalette.text
                : context.colorPalette.scaffoldBackground,
            border: Border.all(color: context.colorPalette.text, width: 1.5),
            borderRadius:
                BorderRadius.all(Radius.circular(Constants.kRadiusChips.r))),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
