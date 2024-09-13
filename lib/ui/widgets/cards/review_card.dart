import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/models/review.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/card_image.dart';
import 'package:ecommerce_shopping_project/ui/widgets/switches/switch_rating_stars.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.review});

  final Review review;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: Constants.kReviewCardSpacingBTWCardsVertical.h),
      padding: EdgeInsets.symmetric(
        horizontal: Constants.kReviewCardPaddingHorizontal.w,
        vertical: Constants.kReviewCardPaddingVertical.h,
      ),
      decoration: BoxDecoration(
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
          CardImage(
            imageUrl: review.senderPhoto,
            height: 150.h,
            width: 150.h,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
          ),

          /// TEXTS
          Expanded(
            child: Container(
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
                            child:
                                SwitchRatingStars(rating: review.productRating),
                          ),
                          Flexible(
                            child: SizedBox(
                                width: Constants
                                    .kReviewCardSpacingBTWItemsVertical.h),
                          ),
                          Flexible(
                            child: TextCustom(
                              text: review.productRating.toStringAsFixed(1),
                              textStyle: context.textTheme.bodyMedium!,
                              color: context.colorPalette.cardTextSecondary,
                            ),
                          ),
                        ],
                      ),
                      Flexible(
                        child: TextCustom(
                          text: review.createdAt.formatDate,
                          textStyle: context.textTheme.bodyMedium!,
                          color: context.colorPalette.cardTextSecondary,
                          fontLetterSpacingCustom: 0,
                          fontSizeCustom: 32,
                          fontWeightCustom: FontWeight.w600,
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
