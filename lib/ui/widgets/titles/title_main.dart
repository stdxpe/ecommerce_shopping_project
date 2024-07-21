import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class TitleMain extends StatelessWidget {
  const TitleMain({
    super.key,
    required this.title,
    this.onPressed,
    this.itemCount,
    this.stepNumber,
    this.icon,
    this.paddingHorizontal,
    this.paddingTop,
    this.paddingBottom,
  });

  final Function? onPressed;
  final String title;
  final int? itemCount;
  final int? stepNumber;
  final IconData? icon;
  final double? paddingHorizontal;
  final double? paddingTop;
  final double? paddingBottom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: paddingTop ?? Constants.kMainTitlePaddingTop.h,
        bottom: paddingBottom ?? Constants.kMainTitlePaddingBottom.h,
        left: paddingHorizontal ?? Constants.kMainPaddingHorizontal.w,
        right: paddingHorizontal ?? Constants.kMainPaddingHorizontal.w,
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
                child: TextCustom(
                  text: title,
                  textStyle: context.textTheme.titleLarge!,
                  color: context.colorPalette.title,
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
                    child: Icon(
                      icon,
                      size: 70.w,
                      color: context.colorPalette.title,
                    ),
                  ),
                ),
            ],
          ),
          if (itemCount != null)
            SizedBox(
                height:
                    Constants.kMainTitleSpacingBTWItemsFoundBTWStepsVertical.h),
          if (itemCount != null)
            TextCustom(
              text: '$itemCount${AppStrings.itemsFound}',
              textStyle: context.textTheme.titleSmall!,
              color: context.colorPalette.titleFaded,
            ),
        ],
      ),
    );
  }
}
