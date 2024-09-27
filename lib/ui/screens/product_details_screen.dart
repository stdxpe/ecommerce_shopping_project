import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:unicons/unicons.dart';

import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/wishlist_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/app_bars/app_bar_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/buttons/double_button_add_or_fav.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/lottie_like_animation.dart';
import 'package:ecommerce_shopping_project/ui/widgets/sliders/details_screen_slider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/switches/switch_rating_stars.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_product_detail.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ProductDetailsScreen extends ConsumerWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: context.colorPalette.scaffoldBackground,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBarMain(
            iconsColor: context.colorPalette.permaBlackColor,
            useTransparentBackground: true,
            automaticallyImplyLeading: true,
            useSearchButton: false,
          ),
          body: SizedBox(
            height: context.mediaQuery.size.height,
            width: context.mediaQuery.size.width,
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        physics: const ClampingScrollPhysics(),
                        children: [
                          DetailsScreenSlider(
                            imageHeight: context.mediaQuery.size.height * 0.57,
                            imagesList: [product.mainPhoto, ...product.photos],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: Constants.kDetailsScreenTitlePaddingTop.h,
                              left: Constants
                                  .kDetailsScreenMainPaddingHorizontal.w,
                              right: Constants
                                  .kDetailsScreenMainPaddingHorizontal.w,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TitleProductDetail(
                                    title: product.title,
                                    price: product.price,
                                    droppedPrice: product.price +
                                        product.price *
                                            product.discountPercent! *
                                            .01),
                                InkWell(
                                  onTap: () {
                                    context.push(Routes.reviews,
                                        extra: product);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: Constants
                                          .kDetailsScreenSpacingBTWItemsVertical
                                          .h,
                                      bottom: Constants
                                          .kDetailsScreenSpacingBTWItemsVertical
                                          .h,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Flexible(
                                              flex: 2,
                                              child: SwitchRatingStars(
                                                rating: product.totalRating,
                                              ),
                                            ),
                                            Flexible(
                                              flex: 1,
                                              child: TextCustom(
                                                text:
                                                    '  ${product.totalRating.toStringAsFixed(1)}   | ',
                                                textStyle: context
                                                    .textTheme.displayMedium!,
                                                color:
                                                    context.colorPalette.text,
                                              ),
                                            ),
                                            Flexible(
                                              flex: 2,
                                              child: TextCustom(
                                                text:
                                                    '  ${product.totalReviewsCount.toString()} ${AppStrings.productDetailsScreenReviews}',
                                                textStyle: context
                                                    .textTheme.displayMedium!,
                                                color:
                                                    context.colorPalette.text,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                            height: Constants
                                                .kDetailsScreenSpacingBTWItemsVertical
                                                .h),
                                        Row(
                                          children: [
                                            Icon(UniconsLine.shopping_bag,
                                                size: 50.h),
                                            TextCustom(
                                              text:
                                                  ' ${product.totalOrdersCount} ${AppStrings.productDetailsScreenOrders}    ',
                                              textStyle: context
                                                  .textTheme.displayMedium!,
                                              color: context.colorPalette.text,
                                            ),
                                            Icon(UniconsLine.heart, size: 50.h),
                                            TextCustom(
                                              text:
                                                  ' ${product.totalLikesCount} ${AppStrings.productDetailsScreenLikes}',
                                              textStyle: context
                                                  .textTheme.displayMedium!,
                                              color: context.colorPalette.text,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                TextCustom(
                                  text:
                                      '${product.summary}\n\n${product.detailedDescription}',
                                  textStyle: context.textTheme.displayMedium!,
                                  color: context.colorPalette.text,
                                  maxLines: 4,
                                  isHeightConstraintRelated: false,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: DoubleButtonAddOrFav(product: product),
                    ),
                  ],
                ),
                LottieLikeAnimation(
                  isLiked: ref.watch(isProductOnWishlist(product)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
