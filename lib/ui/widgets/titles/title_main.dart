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
        top: paddingTop ?? Constants.kPaddingScreensTitleTop.h,
        bottom: paddingBottom ?? Constants.kPaddingTitleBottom.h,
        left: paddingHorizontal ?? Constants.kPaddingMainHorizontal.w,
        right: paddingHorizontal ?? Constants.kPaddingMainHorizontal.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (stepNumber != null)
            Text(
              '${AppStrings.paymentStep}$stepNumber',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.theme.textTheme.titleSmall!.copyWith(
                color: context.theme.colorPalette.titleFaded,
                height: 1,
              ),
            ),
          if (stepNumber != null) SizedBox(height: 0.h),
          // Constants.kPaddingTitleAndItemsFoundAndStepsBetweenVertical.w,

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 5,
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.theme.textTheme.titleLarge!.copyWith(
                    color: context.theme.colorPalette.title,
                  ),
                ),
              ),
              if (icon != null) Flexible(flex: 1, child: SizedBox(width: 10.w)),
              if (icon != null)
                Flexible(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () {
                      if (onPressed != null) onPressed!();
                    },
                    child: Icon(
                      icon,
                      size: 70.w,
                      color: context.theme.colorPalette.title,
                    ),
                  ),
                ),
            ],
          ),
          if (itemCount != null) SizedBox(height: 0.h),
          if (itemCount != null)
            Text(
              '$itemCount${AppStrings.itemsFound}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.theme.textTheme.titleSmall!.copyWith(
                color: context.theme.colorPalette.titleFaded,
                height: 0.8,
              ),
            ),
        ],
      ),
    );
  }
}
