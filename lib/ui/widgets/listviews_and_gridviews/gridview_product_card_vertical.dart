import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/ui/widgets/cards/product_card_vertical.dart';
import 'package:ecommerce_shopping_project/ui/widgets/placeholders/card_placeholder_vertical.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class GridviewProductCardVertical extends StatelessWidget {
  const GridviewProductCardVertical({
    super.key,
    this.itemCountOnRow = 2,
    required this.productsList,
    this.isCardElevated = true,
    required this.paddingMain,
    required this.paddingBetweenElements,
    this.useShimmer = false,
  });

  final List<Product> productsList;
  final int? itemCountOnRow;
  final bool? isCardElevated;
  final double paddingMain;
  final double paddingBetweenElements;
  final bool? useShimmer;

  @override
  Widget build(BuildContext context) {
    double cardWidth = Constants.kRawFigmaDesignWidth;
    int itemCount =
        productsList.length - ((productsList.length) % itemCountOnRow!);

    double fontSizePrimary = (context.textTheme.bodyLarge!.fontSize!.h *
        context.textTheme.bodyLarge!.height!);
    double fontSizeSecondary = (context.textTheme.bodyMedium!.fontSize!.h) *
        context.textTheme.bodyMedium!.height!;
    double paddingTextVertical = Constants.kVerticalCardPaddingVertical.h;
    double paddingTextBetween =
        Constants.kVerticalCardSpacingBTWItemsVertical.h;

    double textSectionHeight = paddingTextVertical +
        paddingTextVertical +
        paddingTextBetween +
        fontSizePrimary +
        fontSizeSecondary;

    double totalPadding =
        (2 * paddingMain) + ((itemCountOnRow! - 1) * paddingBetweenElements);

    double cardTotalWidth = (cardWidth - totalPadding) / itemCountOnRow!;

    double cardTotalHeight = cardTotalWidth.w + textSectionHeight;

    return SizedBox(
      width: 1.sw,
      child: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: paddingMain.w),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: cardTotalHeight / cardTotalWidth,
            mainAxisExtent: cardTotalHeight,
            maxCrossAxisExtent: cardTotalWidth.w,
            mainAxisSpacing: paddingBetweenElements.w,
            crossAxisSpacing: paddingBetweenElements.w,
          ),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return useShimmer!
                ? CardPlaceholderVertical(
                    cardWidth: cardTotalWidth,
                    useDoubleLine: false,
                  )
                : ProductCardVertical(
                    product: productsList[index],
                    cardWidth: cardTotalWidth,
                    isCardElevated: isCardElevated,
                  );
          }),
    );
  }
}
