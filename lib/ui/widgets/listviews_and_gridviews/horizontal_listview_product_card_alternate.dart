import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/models/dummy_product_list.dart';
import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/ui/widgets/cards/product_card_vertical.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class HorizontalListviewProductCardVerticalAlternate extends StatelessWidget {
  const HorizontalListviewProductCardVerticalAlternate({
    super.key,
    required this.productsList,
    required this.cardWidth,
    required this.paddingMain,
    required this.paddingBetweenElements,
    this.isCardElevated = false,
  });

  final List<Product> productsList;
  final double cardWidth;
  final double paddingMain;
  final double paddingBetweenElements;
  final bool? isCardElevated;

  @override
  Widget build(BuildContext context) {
    double fontSizePrimary = Constants.kPaddingCardFontHeightPrimary;
    double fontSizeSecondary = Constants.kPaddingCardFontHeightSecondary;
    double paddingTextVertical = Constants.kPaddingVerticalCardTopAndBottom;
    double paddingTextBetween = Constants.kPaddingVerticalCardTextsBetween;

    double textSectionHeight = paddingTextVertical +
        paddingTextVertical +
        paddingTextBetween +
        fontSizePrimary +
        fontSizeSecondary;

    double cardTotalHeight = cardWidth.w + textSectionHeight.h;

    return SizedBox(
      width: 1.sw,
      height: cardTotalHeight,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: paddingMain.w),
          physics: const ClampingScrollPhysics(),
          clipBehavior: Clip.none,
          itemExtent: cardWidth.w + paddingBetweenElements.w,
          itemCount: productsList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: paddingBetweenElements.w),
              child: ProductCardVertical(
                product: dummyProductList[index],
                isCardElevated: isCardElevated,
                cardWidth: cardWidth,
                fontSizePrimary: fontSizePrimary,
                fontSizeSecondary: fontSizeSecondary,
                paddingTextVertical: paddingTextVertical,
                paddingTextBetween: paddingTextBetween,
              ),
            );
          }),
    );
  }
}
