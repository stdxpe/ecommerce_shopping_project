import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ProductCardHorizontalMini extends StatelessWidget {
  const ProductCardHorizontalMini({
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
          clipBehavior: Clip.hardEdge,
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
                  elevation: 2,
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
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: paddingTextHorizontal.w,
                    ),
                    height: cardHeight.h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 9,
                          child: Container(
                            // color: Colors.yellow,
                            height: fontSizePrimary.h * 2,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              product.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style:
                                  context.theme.textTheme.bodyLarge!.copyWith(
                                color:
                                    context.theme.colorPalette.cardTextPrimary,
                                fontSize: fontSizePrimary.h,
                                height: 1,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        const Flexible(flex: 1, child: SizedBox(width: 0)),
                        Container(
                          // color: Colors.yellow,
                          alignment: Alignment.centerRight,
                          height: fontSizeSecondary.h,
                          child: Text(
                            '\$${product.price.toStringAsFixed(2)}',
                            maxLines: 1,
                            textAlign: TextAlign.end,
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
