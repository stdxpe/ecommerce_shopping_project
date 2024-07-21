import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/ui/widgets/cards/product_card_horizontal.dart';

class HorizontalListviewProductCardHorizontal extends StatelessWidget {
  const HorizontalListviewProductCardHorizontal({
    super.key,
    required this.productsList,
    required this.cardWidth,
    required this.cardHeight,
    required this.paddingMain,
    required this.paddingBetweenElements,
    this.isCardElevated = true,
  });

  final List<Product> productsList;
  final bool? isCardElevated;
  final double cardWidth;
  final double cardHeight;
  final double paddingMain;
  final double paddingBetweenElements;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: cardHeight.h,
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
            child: ProductCardHorizontal(
              isCardElevated: isCardElevated,
              cardWidth: cardWidth,
              cardHeight: cardHeight,
              product: productsList[index],
            ),
          );
        },
      ),
    );
  }
}
