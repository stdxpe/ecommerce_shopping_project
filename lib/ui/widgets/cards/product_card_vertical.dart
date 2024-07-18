import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({
    super.key,
    required this.product,
    required this.cardWidth,
    required this.fontSizePrimary,
    required this.fontSizeSecondary,
    required this.paddingTextVertical,
    required this.paddingTextBetween,
    this.isCardElevated = false,
  });

  final Product product;
  final double cardWidth;
  final double fontSizePrimary;
  final double fontSizeSecondary;
  final double paddingTextVertical;
  final double paddingTextBetween;
  final bool? isCardElevated;

  @override
  Widget build(BuildContext context) {
    double textSectionHeight = paddingTextVertical +
        paddingTextVertical +
        paddingTextBetween +
        fontSizePrimary +
        fontSizeSecondary;

    double cardTotalWidth = cardWidth.w;

    double cardTotalHeight = cardTotalWidth + textSectionHeight.h;

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: cardTotalHeight,
        width: cardTotalWidth,
        clipBehavior: isCardElevated! ? Clip.hardEdge : Clip.none,
        decoration: BoxDecoration(
          color: isCardElevated!
              ? context.theme.colorPalette.cardBackground
              : Colors.transparent,
          borderRadius: BorderRadius.circular(
            isCardElevated! ? Constants.kRadiusCardPrimary.r : 0.r,
          ),
          boxShadow: [
            if (isCardElevated!)
              BoxShadows.kBoxShadowProductCard(
                color: context.theme.colorPalette.shadowPrimary,
              ),
          ],
        ),
        child: Column(
          children: [
            /// CARD IMAGE
            Card(
              margin: EdgeInsets.zero,
              elevation: isCardElevated! ? 1 : 2,
              borderOnForeground: true,
              child: Container(
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
                  borderRadius: BorderRadius.circular(
                    isCardElevated! ? 0 : Constants.kRadiusCardPrimary.r,
                  ),
                  boxShadow: [
                    if (!isCardElevated!)
                      BoxShadows.kBoxShadowPrimary(
                        color: context.theme.colorPalette.shadowPrimary,
                      ),
                  ],
                ),
              ),
            ),

            /// CARD TEXT SECTION
            Container(
              padding: EdgeInsets.symmetric(
                vertical: paddingTextVertical.h,
                horizontal: isCardElevated!
                    ? Constants.kPaddingVerticalCardLeftAndRightIfElevated.w
                    : Constants.kPaddingVerticalCardLeftAndRight.w,
              ),
              height: textSectionHeight.h,
              width: cardTotalWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
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
                  SizedBox(
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
                            color: context.theme.colorPalette.permaWhiteColor
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
    );
  }
}
