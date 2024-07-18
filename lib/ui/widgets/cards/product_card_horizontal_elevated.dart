import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ProductCardHorizontalElevated extends StatelessWidget {
  const ProductCardHorizontalElevated({
    super.key,
    required this.product,
    required this.cardWidth,
    required this.cardHeight,
    required this.fontSizePrimary,
    required this.fontSizeSecondary,
    required this.paddingTextVertical,
    required this.paddingTextHorizontal,
    required this.paddingTextBetween,
  });

  final Product product;
  final double cardWidth;
  final double cardHeight;
  final double fontSizePrimary;
  final double fontSizeSecondary;
  final double paddingTextVertical;
  final double paddingTextHorizontal;
  final double paddingTextBetween;

  @override
  Widget build(BuildContext context) {
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
          clipBehavior: Clip.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              Constants.kRadiusCardPrimary.r,
            ),
          ),
          elevation: 0,

          /// TOTAL CARD
          child: Container(
            height: cardHeight.h,
            width: cardWidth.w,
            // color: Colors.red.withOpacity(0.2),
            child: Row(
              children: [
                /// CARD IMAGE
                Card(
                  margin: EdgeInsets.zero,
                  elevation: 2,
                  borderOnForeground: true,
                  child: Container(
                    height: cardHeight.h,
                    width: cardHeight.h,
                    decoration: BoxDecoration(
                      // color: Colors.green.withOpacity(0.5),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          product.mainPhoto,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(
                        Constants.kRadiusCardPrimary.r,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      // vertical: paddingTextVertical.h,
                      horizontal: paddingTextHorizontal.w,
                    ),
                    // height: textSectionHeight.h,
                    // height: cardHeight.h,
                    // width: cardTotalWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
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
