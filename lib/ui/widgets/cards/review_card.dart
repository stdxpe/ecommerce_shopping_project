import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/models/review.dart';
import 'package:ecommerce_shopping_project/ui/widgets/switches/switch_rating_stars.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
    required this.review,
  });

  final Review review;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Constants.kReviewCardPaddingHorizontal.w,
        vertical: Constants.kReviewCardPaddingVertical.h,
      ),
      decoration: BoxDecoration(
        // color: Colors.red.withOpacity(0.5),
        color: context.colorPalette.sheetBackground,
        borderRadius: BorderRadius.circular(
          Constants.kRadiusCardSecondary.r,
        ),
      ),

      /// IMAGE and TEXTS
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// IMAGE
          Container(
            height: 150.h,
            width: 150.h,
            padding: EdgeInsets.zero,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  review.senderPhoto,
                ),
              ),
              shape: BoxShape.circle,
            ),
          ),

          /// TEXTS
          Expanded(
            child: Container(
              // color: Colors.green.withOpacity(0.5),
              padding: EdgeInsets.symmetric(
                horizontal: Constants.kReviewCardPaddingHorizontal.w,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextCustom(
                    text: review.senderName,
                    textStyle: context.textTheme.bodyLarge!,
                    color: context.colorPalette.cardTextPrimary,
                  ),
                  SizedBox(
                      height: Constants.kReviewCardSpacingBTWItemsVertical.h),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: SwitchRatingStars(
                              rating: review.productRating,
                            ),
                          ),
                          Flexible(
                            child: SizedBox(
                                width: Constants
                                    .kReviewCardSpacingBTWItemsVertical.h),
                          ),
                          Flexible(
                            child: TextCustom(
                              text: review.productRating.toString(),
                              textStyle: context.textTheme.bodyMedium!,
                              color: context.colorPalette.cardTextSecondary,
                            ),
                          ),
                        ],
                      ),
                      Flexible(
                        child: TextCustom(
                          /// TODO: review.createdAt
                          text: 'review.createdAt',
                          textStyle: context.textTheme.bodyMedium!,
                          color: context.colorPalette.cardTextSecondary,
                          fontLetterSpacingCustom: 0,
                          fontWeightCustom: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: Constants.kReviewCardSpacingBTWItemsVertical.h),
                  TextCustom(
                    text: review.text,
                    textStyle: context.textTheme.bodySmall!,
                    color: context.colorPalette.cardTextTertiary,
                    fontWeightCustom: FontWeight.w400,
                    isHeightConstraintRelated: false,
                    maxLines: 7,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
