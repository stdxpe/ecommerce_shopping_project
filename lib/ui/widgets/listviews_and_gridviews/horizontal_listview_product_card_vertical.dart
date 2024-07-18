import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/models/dummy_product_list.dart';
import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/ui/widgets/cards/product_card_vertical.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class HorizontalListviewProductCardVertical extends StatelessWidget {
  const HorizontalListviewProductCardVertical({
    super.key,
    required this.productsList,
    this.itemCountOnRow = 2,
    this.isCardElevated = true,
    required this.paddingMain,
    required this.paddingBetweenElements,
  });

  final List<Product> productsList;
  final int? itemCountOnRow;
  final bool? isCardElevated;
  final double paddingMain;
  final double paddingBetweenElements;

  @override
  Widget build(BuildContext context) {
    double cardWidth = Constants.kRawFigmaDesignWidth;

    double fontSizePrimary = Constants.kPaddingCardFontHeightPrimary;
    double fontSizeSecondary = Constants.kPaddingCardFontHeightSecondary;
    double paddingTextVertical = Constants.kPaddingVerticalCardTopAndBottom;
    double paddingTextBetween = Constants.kPaddingVerticalCardTextsBetween;

    double textSectionHeight = paddingTextVertical +
        paddingTextVertical +
        paddingTextBetween +
        fontSizePrimary +
        fontSizeSecondary;

    double totalPadding =
        (2 * paddingMain) + ((itemCountOnRow! - 1) * paddingBetweenElements);
    double cardTotalWidth = (cardWidth - totalPadding) / itemCountOnRow!;

    double cardTotalHeight = cardTotalWidth.w + textSectionHeight.h;

    return SizedBox(
      width: 1.sw,
      height: cardTotalHeight,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: paddingMain.w),
        physics: const ClampingScrollPhysics(),
        clipBehavior: Clip.none,
        itemExtent: cardTotalWidth.w + paddingBetweenElements.w,
        itemCount: productsList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: paddingBetweenElements.w),
            child: ProductCardVertical(
              product: dummyProductList[index],
              cardWidth: cardTotalWidth,
              isCardElevated: isCardElevated,
              fontSizePrimary: fontSizePrimary,
              fontSizeSecondary: fontSizeSecondary,
              paddingTextVertical: paddingTextVertical,
              paddingTextBetween: paddingTextBetween,
            ),
          );
        },
      ),
    );
  }
}
