import 'package:flutter/material.dart';

import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class SingleColorPickerButton extends StatelessWidget {
  final Color itemColor;
  final bool isSelected;
  final double itemSize;

  const SingleColorPickerButton({
    required this.itemColor,
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
        boxShadow: [
          if (isSelected)
            BoxShadows.kBoxShadowTopBanner(
              color: context.colorPalette.shadowSecondary,
            ),
        ],
        shape: BoxShape.circle,
        color: itemColor,
        border: Border.all(
          width: isSelected ? 4 : 0,
          color: context.colorPalette.permaWhiteColor,
          style: BorderStyle.solid,
          strokeAlign: BorderSide.strokeAlignInside,
        ),
      ),
    );
  }
}
