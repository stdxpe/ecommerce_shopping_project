import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:ecommerce_shopping_project/ui/widgets/app_bars/app_bar_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/buttons/double_button_add_or_fav.dart';
import 'package:ecommerce_shopping_project/ui/widgets/sliders/details_screen_slider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/switches/switch_rating_stars.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_product_detail.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';
import 'package:unicons/unicons.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
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
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      DetailsScreenSlider(
                        imageHeight: context.mediaQuery.size.height * 0.57,
                        imagesList: [product.mainPhoto, ...product.photos],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: Constants.kDetailsScreenTitlePaddingTop.h,
                          left: Constants.kDetailsScreenMainPaddingHorizontal.w,
                          right:
                              Constants.kDetailsScreenMainPaddingHorizontal.w,
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
                            // SizedBox(height: 40.h),
                            // Row(
                            //   children: [
                            //     Icon(UniconsLine.shopping_bag, size: 50.h),
                            //     TextCustom(
                            //       text: ' ${product.totalOrdersCount}   ',
                            //       textStyle: context.textTheme.displayMedium!,
                            //       color: context.colorPalette.text,
                            //     ),
                            //     Icon(UniconsLine.heart, size: 50.h),
                            //     TextCustom(
                            //       text: ' ${product.totalLikesCount}',
                            //       textStyle: context.textTheme.displayMedium!,
                            //       color: context.colorPalette.text,
                            //     ),
                            //   ],
                            // ),
                            InkWell(
                              onTap: () {
                                context.push(Routes.reviews, extra: product);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(top: 50.h, bottom: 50.h
                                    // top: Constants
                                    //     .kDetailsScreenSpacingBTWItemsVertical.h,
                                    ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                            color: context.colorPalette.text,
                                          ),
                                        ),
                                        Flexible(
                                          flex: 2,
                                          child: TextCustom(
                                            text:
                                                '  ${product.totalReviewsCount.toString()} ${AppStrings.productDetailsScreenReviews}',
                                            textStyle: context
                                                .textTheme.displayMedium!,
                                            color: context.colorPalette.text,
                                          ),
                                        ),

                                        // Spacer(),
                                        // TextCustom(
                                        //   text:
                                        //       ' ${product.totalLikesCount} Likes  |  ${product.totalOrdersCount} Orders',
                                        //   textStyle:
                                        //       context.textTheme.displayMedium!,
                                        //   color: context.colorPalette.text,
                                        // ),
                                        // Icon(UniconsLine.shopping_bag, size: 50.h),
                                        // TextCustom(
                                        //   text:
                                        //       ' ${product.totalOrdersCount}   |  ',
                                        //   textStyle:
                                        //       context.textTheme.displayMedium!,
                                        //   color: context.colorPalette.text,
                                        // ),
                                        // Icon(UniconsLine.heart, size: 50.h),
                                        // TextCustom(
                                        //   text: ' ${product.totalLikesCount}',
                                        //   textStyle:
                                        //       context.textTheme.displayMedium!,
                                        //   color: context.colorPalette.text,
                                        // ),

                                        // Icon(CupertinoIcons.heart_fill),
                                      ],
                                    ),
                                    SizedBox(height: 20.h),
                                    Row(
                                      children: [
                                        Icon(UniconsLine.shopping_bag,
                                            size: 50.h),
                                        TextCustom(
                                          text:
                                              ' ${product.totalOrdersCount} Orders    ',
                                          textStyle:
                                              context.textTheme.displayMedium!,
                                          color: context.colorPalette.text,
                                        ),
                                        Icon(UniconsLine.heart, size: 50.h),
                                        TextCustom(
                                          text:
                                              ' ${product.totalLikesCount} Likes',
                                          textStyle:
                                              context.textTheme.displayMedium!,
                                          color: context.colorPalette.text,
                                        ),
                                      ],
                                    ),
                                    // SizedBox(height: 50.h),
                                  ],
                                ),
                              ),
                            ),

                            // SizedBox(height: 25.h),
                            // Row(
                            //   children: [
                            //     Icon(UniconsLine.shopping_bag, size: 50.h),
                            //     TextCustom(
                            //       text:
                            //           ' ${product.totalOrdersCount} Orders    ',
                            //       textStyle: context.textTheme.displayMedium!,
                            //       color: context.colorPalette.text,
                            //     ),
                            //     Icon(UniconsLine.heart, size: 50.h),
                            //     TextCustom(
                            //       text: ' ${product.totalLikesCount} Likes',
                            //       textStyle: context.textTheme.displayMedium!,
                            //       color: context.colorPalette.text,
                            //     ),
                            //   ],
                            // ),
                            // SizedBox(height: 50.h),

                            // TextCustom(
                            //   text:
                            //       '${product.totalOrdersCount} Orders  |  ${product.totalLikesCount} Likes',
                            //   textStyle: context.textTheme.displayMedium!,
                            //   color: context.colorPalette.text,
                            // ),

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
          ),
        ),
      ),
    );
  }
}
