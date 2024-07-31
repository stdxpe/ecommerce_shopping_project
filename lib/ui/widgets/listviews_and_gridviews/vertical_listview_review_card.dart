import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/models/review.dart';
import 'package:ecommerce_shopping_project/ui/widgets/cards/review_card.dart';

class VerticalListviewReviewCard extends StatelessWidget {
  const VerticalListviewReviewCard({
    super.key,
    required this.reviewsList,
    required this.paddingMain,
    required this.paddingBetweenElements,
  });

  final List<Review> reviewsList;

  final double paddingMain;
  final double paddingBetweenElements;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: paddingMain.w),
        physics: const NeverScrollableScrollPhysics(),
        clipBehavior: Clip.none,
        itemCount: reviewsList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          var currentItem = reviewsList[index];
          return Padding(
            padding: EdgeInsets.only(bottom: paddingBetweenElements.h),
            child: ReviewCard(
              review: Review(
                senderName: currentItem.senderName,
                senderPhoto: currentItem.senderPhoto,
                productRating: currentItem.productRating,
                createdAt: currentItem.createdAt,
                text: currentItem.text,
                product: currentItem.product,
              ),
            ),
          );
        },
      ),
    );
  }
}
