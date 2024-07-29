import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/ui/widgets/cards/product_card_horizontal_mini.dart';

class VerticalListviewProductCardHorizontalMini extends StatelessWidget {
  const VerticalListviewProductCardHorizontalMini({
    super.key,
    required this.productsList,
    required this.cardHeight,
    this.isCardElevated = true,
    this.useSoftShadow = false,
    required this.paddingMain,
    required this.paddingBetweenElements,
  });

  final List<Product> productsList;
  final double cardHeight;
  final bool? isCardElevated;
  final bool? useSoftShadow;
  final double paddingMain;
  final double paddingBetweenElements;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
            product: productsList[index],
            isCardElevated: isCardElevated,
            useSoftShadow: useSoftShadow,
            cardWidth: 1.sw,
            cardHeight: cardHeight,
          ),
        );
      },
    );
  }
}
