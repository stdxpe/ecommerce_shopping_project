import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class RatingSummaryProgressBar extends StatelessWidget {
  const RatingSummaryProgressBar({
    super.key,
    required this.text,
    required this.ratingCount,
    required this.totalRatingCount,
    this.paddingHorizontal,
    this.height = 40,
  });

  final String text;
  final double ratingCount;
  final double totalRatingCount;
  final double? paddingHorizontal;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green.withOpacity(0.5),
      margin: EdgeInsets.symmetric(
        vertical: 20.h,
      ),
      height: height!.h + 10.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 55,
            child: TextCustom(
              text: text,
              textStyle: context.textTheme.bodyLarge!,
              color: context.colorPalette.textFaded,
              fontSizeCustom: height! + 7.5,
              fontHeightCustom: 1,
              fontWeightCustom: FontWeight.w500,
              fontLetterSpacingCustom: 0.5,
              textAlignCustom: TextAlign.start,
            ),
          ),
          Expanded(
            child: LinearProgressIndicator(
              value: ratingCount / totalRatingCount,
              minHeight: height!.h,
              borderRadius: BorderRadius.circular(100.r),
              color: ColorPalette.ratedStarColor,
              backgroundColor: ColorPalette.unratedStarColor,
            ),
          ),
          SizedBox(
            width: 55,
            child: TextCustom(
              text:
                  '${(ratingCount / totalRatingCount * 100).toStringAsFixed(0)}%',
              textStyle: context.textTheme.bodyLarge!,
              color: context.colorPalette.text,
              fontSizeCustom: height!,
              fontHeightCustom: 1,
              fontWeightCustom: FontWeight.w600,
              fontLetterSpacingCustom: 0.5,
              textAlignCustom: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
