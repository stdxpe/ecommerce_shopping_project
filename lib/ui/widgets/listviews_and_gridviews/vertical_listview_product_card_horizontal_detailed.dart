import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/ui/widgets/cards/product_card_horizontal_detailed.dart';
import 'package:ecommerce_shopping_project/ui/widgets/dismissible_delete_widget.dart';
import 'package:ecommerce_shopping_project/ui/widgets/switches/switch_item_counter.dart';

class VerticalListviewProductCardHorizontalDetailed extends StatelessWidget {
  const VerticalListviewProductCardHorizontalDetailed({
    super.key,
    required this.productsList,
    required this.cardHeight,
    this.isCardElevated = true,
    required this.paddingMain,
    required this.paddingBetweenElements,
    this.useItemCounter = true,
    this.dismissibleEnabled = false,
  });

  final List<Product> productsList;
  final double cardHeight;
  final bool? isCardElevated;
  final bool? useItemCounter;
  final double paddingMain;
  final double paddingBetweenElements;
  final bool? dismissibleEnabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        // padding: EdgeInsets.symmetric(horizontal: paddingMain.w),
        physics: const ClampingScrollPhysics(),
        clipBehavior: Clip.none,
        // itemExtent: cardHeight.h + paddingBetweenElements.h,
        itemCount: productsList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return DismissibleDeleteWidget(
            /// TODO: UNIQUE KEY TO BE CHANGED with Product ID's.
            uniqueKey: '$index',
            dismissibleEnabled: dismissibleEnabled,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: paddingBetweenElements.w / 2,
                top: paddingBetweenElements.w / 2,
                left: paddingMain.w,
                right: paddingMain.w,
              ),
              child: Stack(
                children: [
                  ProductCardHorizontalDetailed(
                    /// TODO: Bottom Info and Product Model Class relation
                    bottomInfo: 'Size:  M  |  Color: Red',
                    product: productsList[index],
                    isCardElevated: isCardElevated,
                    cardHeight: cardHeight,
                  ),
                  if (useItemCounter == true)
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
            ),
          );
        },
      ),
    );
  }
}
