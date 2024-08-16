import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/models/deprecated/product.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/rating_summary_progress_bar.dart';
import 'package:ecommerce_shopping_project/ui/widgets/switches/switch_rating_stars.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class SwitchRatingSummary extends StatelessWidget {
  const SwitchRatingSummary({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 9,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Flexible(
                    child: TextCustom(
                      text: product.totalRating.toStringAsFixed(1),
                      textStyle: context.textTheme.bodyLarge!,
                      color: context.colorPalette.cardTextPrimary,
                      fontSizeCustom: 100,
                      fontHeightCustom: 1,
                    ),
                  ),
                  Flexible(
                    child: TextCustom(
                      text: '  out of 5',
                      textStyle: context.textTheme.bodyMedium!,
                      color: context.colorPalette.cardTextSecondary,
                      fontSizeCustom: 50,
                      fontHeightCustom: 1.4,
                      fontWeightCustom: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const Flexible(flex: 1, child: SizedBox(width: 0)),
            SwitchRatingStars(
              rating: product.totalRating,
              starSize: 75.h,
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextCustom(
            text: '${product.reviews.length} reviews  ',
            textStyle: context.textTheme.bodySmall!,
            color: context.colorPalette.cardTextSecondary,
            fontHeightCustom: 1.6,
            fontWeightCustom: FontWeight.w500,
          ),
        ),
        SizedBox(height: 50.h),
        const RatingSummaryProgressBar(
          text: '5.0',
          ratingCount: 6,
          totalRatingCount: 25,
        ),
        const RatingSummaryProgressBar(
          text: '4.0',
          ratingCount: 4,
          totalRatingCount: 25,
        ),
        const RatingSummaryProgressBar(
          text: '3.0',
          ratingCount: 7,
          totalRatingCount: 25,
        ),
        const RatingSummaryProgressBar(
          text: '2.0',
          ratingCount: 2,
          totalRatingCount: 25,
        ),
        const RatingSummaryProgressBar(
          text: '1.0',
          ratingCount: 6,
          totalRatingCount: 25,
        ),
      ],
    );
  }
}
