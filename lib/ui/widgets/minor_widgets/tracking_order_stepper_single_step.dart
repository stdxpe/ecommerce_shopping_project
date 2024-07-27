import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class TrackingOrderStepperSingleStep extends StatelessWidget {
  const TrackingOrderStepperSingleStep({
    super.key,
    required this.title,
    this.iconSize = 80,
    required this.isActive,
    this.contentText,
    this.isLastStep = false,
    this.date,
    this.showContent = false,
  });

  final String title;
  final double? iconSize;
  final String? contentText;
  final String? date;
  final bool isActive;
  final bool? showContent;
  final bool? isLastStep;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: iconSize!.h,
                  width: iconSize!.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        isActive ? Colors.red : Colors.black.withOpacity(0.12),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.check,
                      size: iconSize!.h - 30.h,
                      color: isActive
                          ? Colors.white
                          : Colors.black.withOpacity(0.3),
                    ),
                  ),
                ),
                SizedBox(width: 40.w),
                TextCustom(
                  text: title,
                  textStyle: context.textTheme.bodySmall!,
                  color: isActive
                      ? context.colorPalette.title
                      : context.colorPalette.title.withOpacity(0.4),
                  fontSizeCustom: 40,
                  fontWeightCustom: FontWeight.w500,
                ),
              ],
            ),
            if (isActive && date != null)
              TextCustom(
                text: date!,
                textStyle: context.textTheme.bodySmall!,
                color: context.colorPalette.title.withOpacity(0.6),
                fontSizeCustom: 35,
                fontWeightCustom: FontWeight.w500,
              ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(
            left: 85.w / 2,
            top: 25.h,
            bottom: 25.h,
          ),
          padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 50.h),
          width: double.infinity,
          decoration: BoxDecoration(
            // color: Colors.red.withOpacity(0.5),
            border: Border(
              left: BorderSide(
                color: isLastStep!
                    ? Colors.transparent
                    : Colors.black.withOpacity(0.1),
                width: 1.5,
              ),
            ),
          ),
          child: (showContent! && contentText != null)
              ? Center(
                  child: TextCustom(
                    text: contentText!,
                    textStyle: context.textTheme.bodySmall!,
                    color: context.colorPalette.title.withOpacity(0.75),
                    fontSizeCustom: 35,
                    fontHeightCustom: 1.2,
                    maxLines: 3,
                    isHeightConstraintRelated: false,
                    textAlignCustom: TextAlign.center,
                  ),
                )
              : const SizedBox(),
        ),
      ],
    );
  }
}
