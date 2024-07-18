import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/ui/widgets/cards/product_card_horizontal_mini.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class VerticalListviewProductCardHorizontalMini extends StatelessWidget {
  const VerticalListviewProductCardHorizontalMini({
    super.key,
    required this.productsList,
    required this.cardHeight,
    this.isCardElevated = true,
    required this.paddingMain,
    required this.paddingBetweenElements,
  });

  final List<Product> productsList;
  final double cardHeight;
  final bool? isCardElevated;
  final double paddingMain;
  final double paddingBetweenElements;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: paddingMain.w),
        physics: const ClampingScrollPhysics(),
        clipBehavior: Clip.none,
        itemExtent: cardHeight.h + paddingBetweenElements.w,
        itemCount: productsList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: paddingBetweenElements.w),
            child: ProductCardHorizontalMini(
              isCardElevated: isCardElevated,
              product: productsList[index],
              cardWidth: Constants.kRawFigmaDesignWidth,
              cardHeight: cardHeight,
              fontSizePrimary: Constants.kPaddingCardFontHeightPrimary,
              fontSizeSecondary: Constants.kPaddingCardFontHeightSecondary,
              paddingTextVertical: Constants.kPaddingHorizontalCardTopAndBottom,
              paddingTextHorizontal:
                  Constants.kPaddingHorizontalCardeftAndRight,
              paddingTextBetween: Constants.kPaddingHorizontalCardTextsBetween,
            ),
          );
        },
      ),
    );
  }
}
