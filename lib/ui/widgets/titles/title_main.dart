import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class TitleMain extends StatelessWidget {
  const TitleMain({
    super.key,
    required this.title,
    this.onPressed,
    this.itemCount,
    this.stepNumber,
    this.icon,
    this.iconSize = 70,
    this.paddingLeft,
    this.paddingRight,
    this.paddingTop,
    this.paddingBottom,
    this.enableTitleAsBackButton = false,
  });

  final Function()? onPressed;
  final bool? enableTitleAsBackButton;
  final String title;
  final int? itemCount;
  final int? stepNumber;
  final IconData? icon;
  final double? iconSize;
  final double? paddingLeft;
  final double? paddingRight;
  final double? paddingTop;
  final double? paddingBottom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: paddingTop ?? Constants.kMainTitlePaddingTop.h,
        bottom: paddingBottom ?? Constants.kMainTitlePaddingBottom.h,
        left: paddingLeft ?? Constants.kMainPaddingHorizontal.w,
        right: paddingRight ?? Constants.kMainPaddingHorizontal.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (stepNumber != null)
            TextCustom(
              text: '${AppStrings.paymentStep}$stepNumber',
              textStyle: context.textTheme.titleSmall!,
              color: context.colorPalette.titleFaded,
            ),
          if (stepNumber != null)
            SizedBox(
                height:
                    Constants.kMainTitleSpacingBTWItemsFoundBTWStepsVertical.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 10,
                child: GestureDetector(
                  onTap: () {
                    if (enableTitleAsBackButton!) context.pop();
                  },
                  child: TextCustom(
                    text: title,
                    textStyle: context.textTheme.titleLarge!,
                    color: context.colorPalette.title,
                  ),
                ),
              ),
              if (icon != null) Flexible(flex: 1, child: SizedBox(width: 0.w)),
              if (icon != null)
                Flexible(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      if (onPressed != null) onPressed!();
                    },
                    child: SizedBox(
                      height: iconSize!.w,
                      width: iconSize!.w,
                      child: Icon(
                        icon,
                        size: iconSize!.w,
                        color: context.colorPalette.title,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          if (itemCount != null && itemCount != 0)
            SizedBox(
                height:
                    Constants.kMainTitleSpacingBTWItemsFoundBTWStepsVertical.h),
          if (itemCount != null && itemCount != 0)
            TextCustom(
              text: (itemCount == 1)
                  ? '$itemCount${AppStrings.itemFound}'
                  : '$itemCount${AppStrings.itemsFound}',
              textStyle: context.textTheme.titleSmall!,
              color: context.colorPalette.titleFaded,
            ),
        ],
      ),
    ).animate().fadeIn(duration: 1000.ms);
  }
}
