import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:unicons/unicons.dart';

import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/ui_general_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/cards/product_card_horizontal_mini.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/vertical_listview_review_card.dart';
import 'package:ecommerce_shopping_project/ui/widgets/switches/switch_rating_summary.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ReviewsScreen extends ConsumerWidget {
  const ReviewsScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var card = ref.watch(
        horizontalCard((cardHeight: null, cardWidth: null, ctx: context)));

    return Scaffold(
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
              card: card,
              onPressed: () => context.pop(),
            ),
            SizedBox(
                height: Constants.kDetailsScreenSpacingBTWItemsVertical.h * 2),
            SwitchRatingSummary(product: product),
            SizedBox(
                height: Constants.kDetailsScreenSpacingBTWItemsVertical.h * 2),
            Row(
              children: [
                SizedBox(width: 30.w),
                Icon(UniconsLine.shopping_bag, size: 50.h),
                TextCustom(
                  text:
                      ' ${product.totalOrdersCount} ${AppStrings.productDetailsScreenOrders}    ',
                  textStyle: context.textTheme.displayMedium!,
                  color: context.colorPalette.text,
                ),
                Icon(UniconsLine.heart, size: 50.h),
                TextCustom(
                  text:
                      ' ${product.totalLikesCount} ${AppStrings.productDetailsScreenLikes}',
                  textStyle: context.textTheme.displayMedium!,
                  color: context.colorPalette.text,
                ),
              ],
            ),
            SizedBox(height: Constants.kDetailsScreenSpacingBTWItemsVertical.h),
            VerticalListviewReviewCard(productId: product.id),
            SizedBox(height: Constants.kDetailsScreenSpacingBTWItemsVertical.h),
          ],
        ),
      ),
    );
  }
}
