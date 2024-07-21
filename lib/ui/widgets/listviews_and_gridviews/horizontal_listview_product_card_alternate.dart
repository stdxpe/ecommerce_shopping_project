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
    double fontSizePrimary = (context.textTheme.bodyLarge!.fontSize!.h *
            context.textTheme.bodyLarge!.height!) *
        2;
    double fontSizeSecondary = context.textTheme.bodyMedium!.fontSize!.h;
    double paddingTextVertical = Constants.kVerticalCardPaddingVertical.h;
    double paddingTextBetween =
        Constants.kVerticalCardSpacingBTWItemsVertical.h;

    double textSectionHeight = paddingTextVertical +
        fontSizePrimary +
        fontSizeSecondary +
        paddingTextBetween +
        paddingTextVertical;

    double cardTotalHeight = cardWidth.w + textSectionHeight;

    return Container(
      color: Colors.red.withOpacity(0.5),
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
                maxLineCount: 2,
              ),
            );
          }),
    );
  }
}
