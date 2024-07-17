import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ProductCardVerticalElevated extends StatelessWidget {
  const ProductCardVerticalElevated({
    super.key,
    required this.product,
    required this.cardWidth,
    required this.fontSizePrimary,
    required this.fontSizeSecondary,
    required this.paddingTextVertical,
    required this.paddingTextBetween,
    required this.paddingTextHorizontal,
  });

  final Product product;
  final double cardWidth;
  final double fontSizePrimary;
  final double fontSizeSecondary;
  final double paddingTextVertical;
  final double paddingTextHorizontal;
  final double paddingTextBetween;

  @override
  Widget build(BuildContext context) {
    double textSectionHeight = paddingTextVertical +
        paddingTextVertical +
        paddingTextBetween +
        fontSizePrimary +
        fontSizeSecondary;

    double cardTotalWidth = cardWidth.w;

    double cardTotalHeight = cardTotalWidth + textSectionHeight.h;

    print(context.mediaQuery.size.width / 3);
    print('cardHeight $cardTotalWidth');
    print('textSectionHeight ${textSectionHeight.h}');
    print('cardTotalHeight $cardTotalHeight');

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            Constants.kRadiusCardPrimary.r,
          ),
          boxShadow: [
            BoxShadows.kBoxShadowPrimary(
              color: context.theme.colorPalette.shadowPrimary,
            ),
          ],
        ),
        child: Card(
          margin: EdgeInsets.zero,
          color: Colors.white,
          borderOnForeground: true,
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            // side: BorderSide.none,
            borderRadius: BorderRadius.circular(
              Constants.kRadiusCardPrimary.r,
            ),
          ),
          elevation: 0,

          /// TOTAL CARD
          child: Container(
            height: cardTotalHeight,
            width: cardTotalWidth,
            // color: Colors.red.withOpacity(0.2),
            child: Column(
              children: [
                /// CARD IMAGE
                Container(
                  clipBehavior: Clip.hardEdge,
                  height: cardTotalWidth,
                  width: cardTotalWidth,
                  decoration: BoxDecoration(
                    // color: Colors.green.withOpacity(0.5),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        product.mainPhoto,
                      ),
                    ),

                    // boxShadow: [
                    //   BoxShadows.kBoxShadowPrimary(
                    //     color: context.theme.colorPalette.shadowPrimary,
                    //   ),
                    // ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: paddingTextVertical.h,
                    horizontal: paddingTextHorizontal.w,
                  ),
                  // color: Colors.black.withOpacity(0.2),
                  height: textSectionHeight.h,
                  width: cardTotalWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        // color: Colors.yellow,
                        height: fontSizePrimary.h,
                        child: Text(
                          product.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.theme.textTheme.bodyLarge!.copyWith(
                            color: context.theme.colorPalette.cardTextPrimary,
                            fontSize: fontSizePrimary.h,
                            height: 1,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(height: paddingTextBetween.h),
                      Container(
                        // color: Colors.yellowAccent,
                        height: fontSizeSecondary.h,
                        child: Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.theme.textTheme.bodyMedium!.copyWith(
                            color: context.theme.colorPalette.cardTextSecondary,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
