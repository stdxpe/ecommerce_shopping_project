import 'package:flutter/material.dart';

import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class SingleSizePickerButton extends StatelessWidget {
  final String item;
  final bool isSelected;
  final double itemSize;

  const SingleSizePickerButton({
    required this.item,
    required this.isSelected,
    required this.itemSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      height: itemSize,
      width: itemSize,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected
              ? context.colorPalette.buttonMainBackgroundPrimary
              : context.colorPalette.sheetBackground,
          boxShadow: [
            if (isSelected == true)
              BoxShadows.kBoxShadowTopBanner(
                  color: context.colorPalette.shadowPrimary),
          ]),
      child: Center(
        child: TextCustom(
          text: item,
          textStyle: context.textTheme.displaySmall!,
          color: isSelected
              ? context.colorPalette.scaffoldBackground
              : context.colorPalette.text,
          fontWeightCustom: isSelected ? FontWeight.w600 : FontWeight.w500,
          fontSizeCustom: 42,
        ),
      ),
    );
  }
}
