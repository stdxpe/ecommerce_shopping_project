import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/models/deprecated/product.dart';
import 'package:ecommerce_shopping_project/ui/widgets/app_bars/app_bar_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/cards/product_card_horizontal_mini.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/vertical_listview_review_card.dart';
import 'package:ecommerce_shopping_project/ui/widgets/switches/switch_rating_summary.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarMain(
        automaticallyImplyLeading: true,
        useSearchButton: false,
      ),
      body: SafeArea(
        bottom: false,
        child: ListView(
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: Constants.kMainPaddingHorizontal.w,
          ),
          children: [
            SizedBox(height: 10.h),
            ProductCardHorizontalMini(
              product: product,
              isCardElevated: true,
              cardWidth: 1.sw,
              cardHeight: 200,
            ),
            SizedBox(height: 100.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 55.w),
              child: SwitchRatingSummary(product: product),
            ),
            SizedBox(height: 100.h),
            VerticalListviewReviewCard(
              reviewsList: product.reviews,
              paddingMain: 0,
              paddingBetweenElements: Constants.kMainSpacingBTWCardsVertical.h,
            ),
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }
}
