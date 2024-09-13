import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/reviews_provider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/rating_summary_progress_bar.dart';
import 'package:ecommerce_shopping_project/ui/widgets/switches/switch_rating_stars.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class SwitchRatingSummary extends ConsumerWidget {
  const SwitchRatingSummary({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 55.w),
      child: Column(
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
              text: '${product.totalReviewsCount} reviews  ',
              textStyle: context.textTheme.bodySmall!,
              color: context.colorPalette.cardTextSecondary,
              fontHeightCustom: 1.6,
              fontWeightCustom: FontWeight.w500,
            ),
          ),
          SizedBox(height: 50.h),
          ref.watch(reviewsProvider(product.id)).when(
                error: (error, stackTrace) => const SizedBox(),
                loading: () => const SizedBox(),
                data: (data) {
                  var summary = ref.watch(reviewSummaryProvider(data));
                  print('summary: $summary');
                  return Column(
                    children: [
                      RatingSummaryProgressBar(
                          text: '5.0',
                          ratingCount: summary.ratingCountStar4_5,
                          totalRatingCount: summary.totalRatingCount),
                      RatingSummaryProgressBar(
                          text: '4.0',
                          ratingCount: summary.ratingCountStar3_4,
                          totalRatingCount: summary.totalRatingCount),
                      RatingSummaryProgressBar(
                          text: '3.0',
                          ratingCount: summary.ratingCountStar2_3,
                          totalRatingCount: summary.totalRatingCount),
                      RatingSummaryProgressBar(
                          text: '2.0',
                          ratingCount: summary.ratingCountStar1_2,
                          totalRatingCount: summary.totalRatingCount),
                      RatingSummaryProgressBar(
                          text: '1.0',
                          ratingCount: summary.ratingCountStar0_1,
                          totalRatingCount: summary.totalRatingCount),
                    ],
                  );
                },
              ),
        ],
      ),
    );
  }
}
