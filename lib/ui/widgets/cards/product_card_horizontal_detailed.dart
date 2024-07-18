import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ProductCardHorizontalDetailed extends StatelessWidget {
  const ProductCardHorizontalDetailed({
    super.key,
    required this.product,
    required this.bottomInfo,
    required this.cardWidth,
    required this.cardHeight,
    required this.fontSizePrimary,
    required this.fontSizeSecondary,
    required this.fontSizeTertiary,
    required this.paddingTextVertical,
    required this.paddingTextHorizontal,
    required this.paddingTextBetween,
    this.isCardElevated = false,
  });

  final Product product;
  final String bottomInfo;
  final double cardWidth;
  final double cardHeight;
  final double fontSizePrimary;
  final double fontSizeSecondary;
  final double fontSizeTertiary;
  final double paddingTextVertical;
  final double paddingTextHorizontal;
  final double paddingTextBetween;
  final bool? isCardElevated;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        decoration: BoxDecoration(
          color: isCardElevated!
              ? context.theme.colorPalette.cardBackground
              : Colors.transparent,
          borderRadius: BorderRadius.circular(
            Constants.kRadiusCardPrimary.r,
          ),
          boxShadow: [
            if (isCardElevated!)
              BoxShadows.kBoxShadowProductCard(
                color: context.theme.colorPalette.shadowPrimary,
              ),
          ],
        ),
        child: Card(
          margin: EdgeInsets.zero,
          color: isCardElevated!
              ? context.theme.colorPalette.cardBackground
              : Colors.transparent,
          clipBehavior: Clip.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              Constants.kRadiusCardPrimary.r,
            ),
          ),
          elevation: 0,

          /// TOTAL CARD
          child: SizedBox(
            height: cardHeight.h,
            width: cardWidth.w,
            child: Row(
              children: [
                /// CARD IMAGE
                Card(
                  margin: EdgeInsets.zero,
                  elevation: 1,
                  borderOnForeground: true,
                  child: Container(
                    height: cardHeight.h,
                    width: cardHeight.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          product.mainPhoto,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(
                        Constants.kRadiusCardPrimary.r,
                      ),
                      boxShadow: [
                        BoxShadows.kBoxShadowPrimary(
                          color: context.theme.colorPalette.shadowPrimary,
                        ),
                      ],
                    ),
                  ),
                ),

                /// CARD TEXTS
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: paddingTextVertical.h,
                      horizontal: paddingTextHorizontal.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              // color: Colors.yellow,
                              height: fontSizePrimary.h,
                              child: Text(
                                product.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    context.theme.textTheme.bodyLarge!.copyWith(
                                  color: context
                                      .theme.colorPalette.cardTextPrimary,
                                  fontSize: fontSizePrimary.h,
                                  height: 1,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(height: paddingTextBetween.h),
                            SizedBox(
                              // color: Colors.yellowAccent,
                              height: fontSizeSecondary.h,
                              child: Text(
                                '\$${product.price.toStringAsFixed(2)}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: context.theme.textTheme.bodyMedium!
                                    .copyWith(
                                  color: context
                                      .theme.colorPalette.cardTextSecondary,
                                  fontSize: fontSizeSecondary.h,
                                  fontWeight: FontWeight.w700,
                                  height: 1,
                                  shadows: [
                                    BoxShadows.kBoxShadowProductCardText(
                                      color: context
                                          .theme.colorPalette.permaWhiteColor
                                          .withOpacity(0.54),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          // color: Colors.yellowAccent,
                          height: fontSizeSecondary.h,
                          child: Text(
                            bottomInfo,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: context.theme.textTheme.bodyMedium!.copyWith(
                              color:
                                  context.theme.colorPalette.cardTextSecondary,
                              fontSize: fontSizeSecondary.h,
                              fontWeight: FontWeight.w700,
                              height: 1,
                              shadows: [
                                BoxShadows.kBoxShadowProductCardText(
                                  color: context
                                      .theme.colorPalette.permaWhiteColor
                                      .withOpacity(0.54),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
