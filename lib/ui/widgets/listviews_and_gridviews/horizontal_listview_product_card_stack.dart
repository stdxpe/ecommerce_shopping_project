import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/ui/widgets/cards/product_card_stack.dart';

class HorizontalListviewProductCardStack extends StatelessWidget {
  const HorizontalListviewProductCardStack({
    super.key,
    required this.productsList,
    required this.cardWidth,
    required this.paddingMain,
    required this.paddingBetweenElements,
  });

  final List<Product> productsList;
  final double cardWidth;
  final double paddingMain;
  final double paddingBetweenElements;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: cardWidth.w,
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
              child: ProductCardStack(
                onPressed: () {},
                product: productsList[index],
                cardWidth: cardWidth,

                /// TODO: Bottom Text and Product Model Class relation?
                bottomText: 'Size: M  |  Color: Red',
              ),
            );
          }),
    );
  }
}
