import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class SwitchVerificationCodeDots extends StatelessWidget {
  final int itemCount;
  final int currentIndex;
  final double? dotSize;
  final double? dotSpacing;
  final Color? emptyDotColor;
  final Color? enteredDotColor;

  const SwitchVerificationCodeDots({
    required this.itemCount,
    required this.currentIndex,
    this.dotSize = 75.0,
    this.dotSpacing = 40.0,
    this.emptyDotColor,
    this.enteredDotColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (var i = 0; i < itemCount; i++)
          if (i < currentIndex)
            Container(
              width: dotSize!.h,
              height: dotSize!.h,
              margin: EdgeInsets.symmetric(
                horizontal: dotSpacing!.w,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: enteredDotColor ??
                    context.colorPalette.text.withOpacity(0.9),
              ),
            )
          else
            Container(
              width: dotSize!.h,
              height: dotSize!.h,
              margin: EdgeInsets.symmetric(
                horizontal: dotSpacing!.w,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: emptyDotColor ??
                    context.colorPalette.text.withOpacity(0.15),
              ),
            )
      ],
    );
  }
}
