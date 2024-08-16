import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/models/deprecated/product.dart';
import 'package:ecommerce_shopping_project/ui/widgets/cards/product_card_vertical.dart';
import 'package:ecommerce_shopping_project/ui/widgets/placeholders/card_placeholder_vertical.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class HorizontalListviewProductCardVerticalAlternate extends StatelessWidget {
  const HorizontalListviewProductCardVerticalAlternate({
    super.key,
    required this.productsList,
    required this.cardWidth,
    required this.paddingMain,
    required this.paddingBetweenElements,
    this.isCardElevated = false,
    this.useShimmer = false,
  });

  final List<Product> productsList;
  final double cardWidth;
  final double paddingMain;
  final double paddingBetweenElements;
  final bool? isCardElevated;
  final bool? useShimmer;

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

    return SizedBox(
      // color: Colors.red.withOpacity(0.5),
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
              child: useShimmer!
                  ? CardPlaceholderVertical(cardWidth: cardWidth)
                  : ProductCardVertical(
                      /// TODO: New Product provider
                      // isNewProduct: true,
                      isOnSale: productsList[index].isOnSale,
                      product: productsList[index],
                      isCardElevated: isCardElevated,
                      cardWidth: cardWidth,
                      maxLineCount: 2,
                    ),
            );
          }),
    );
  }
}
