import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/ui/widgets/cards/product_card_horizontal_detailed.dart';
import 'package:ecommerce_shopping_project/ui/widgets/switches/switch_item_counter.dart';

class VerticalListviewProductCardHorizontalDetailed extends StatelessWidget {
  const VerticalListviewProductCardHorizontalDetailed({
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
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: paddingMain.w),
        physics: const ClampingScrollPhysics(),
        clipBehavior: Clip.none,
        itemExtent: cardHeight.h + paddingBetweenElements.h,
        itemCount: productsList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: paddingBetweenElements.h),
            child: Stack(
              children: [
                ProductCardHorizontalDetailed(
                  /// TODO: Bottom Info and Product Model Class relation
                  bottomInfo: 'Size:  M  |  Color: Red',
                  product: productsList[index],
                  isCardElevated: isCardElevated,
                  cardHeight: cardHeight,
                ),
                Positioned.fill(
                  // bottom: paddingBetweenElements.h,
                  right: 25.w,
                  bottom: 10.h,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: SwitchItemCounter(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
