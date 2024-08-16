import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/models/deprecated/cart_product.dart';
import 'package:ecommerce_shopping_project/ui/widgets/cards/order_product_card_horizontal_detailed.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/dismissible_delete_widget.dart';
import 'package:ecommerce_shopping_project/ui/widgets/switches/switch_item_counter.dart';

class VerticalListviewOrderProductCardHorizontal extends StatelessWidget {
  const VerticalListviewOrderProductCardHorizontal({
    super.key,
    required this.cartProductsList,
    required this.cardHeight,
    this.isCardElevated = false,
    required this.paddingMain,
    required this.paddingBetweenElements,
    this.dismissibleEnabled = true,
    this.useItemCounter = false,
    this.onPressedDecrease,
    this.onPressedIncrease,
    this.onDismissed,
  });

  final List<CartProduct> cartProductsList;
  final double cardHeight;
  final bool? isCardElevated;
  final double paddingMain;
  final double paddingBetweenElements;
  final bool? dismissibleEnabled;
  final bool? useItemCounter;
  final Function(int index)? onPressedDecrease;
  final Function(int index)? onPressedIncrease;
  final Function(int index)? onDismissed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        clipBehavior: Clip.none,
        itemCount: cartProductsList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return DismissibleDeleteWidget(
            onDismissed: () => onDismissed!(index),
            uniqueKey: cartProductsList[index].id,
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
                  OrderProductCardHorizontalDetailed(
                    orderProduct: cartProductsList[index],
                    useItemCounter: useItemCounter,
                    isCardElevated: isCardElevated,
                    cardHeight: cardHeight,
                  ),
                  if (useItemCounter!)
                    Positioned.fill(
                      right: 25.w,
                      bottom: 10.h,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: SwitchItemCounter(
                          itemCount: cartProductsList[index].itemCount,
                          onPressedDecrease: () => onPressedDecrease!(index),
                          onPressedIncrease: () => onPressedIncrease!(index),
                        ),
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
