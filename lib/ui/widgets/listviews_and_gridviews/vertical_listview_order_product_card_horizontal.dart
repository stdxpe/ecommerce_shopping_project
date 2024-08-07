import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/models/order_product.dart';
import 'package:ecommerce_shopping_project/ui/widgets/cards/order_product_card_horizontal_detailed.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/dismissible_delete_widget.dart';
import 'package:ecommerce_shopping_project/ui/widgets/placeholders/card_placeholder_horizontal.dart';
import 'package:ecommerce_shopping_project/ui/widgets/switches/switch_item_counter.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class VerticalListviewOrderProductCardHorizontal extends ConsumerWidget {
  const VerticalListviewOrderProductCardHorizontal({
    super.key,
    required this.orderProductsList,
    required this.cardHeight,
    this.isCardElevated = false,
    required this.paddingMain,
    required this.paddingBetweenElements,
    this.dismissibleEnabled = true,
    this.useShimmer = false,
    required this.onPressedMinus,
    required this.onPressedPlus,
    required this.onDismissed,
  });

  final List<OrderProduct> orderProductsList;
  final double cardHeight;
  final bool? isCardElevated;
  final double paddingMain;
  final double paddingBetweenElements;
  final bool? dismissibleEnabled;
  final bool? useShimmer;
  final Function() onPressedMinus;
  final Function() onPressedPlus;
  final Function(int index) onDismissed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        clipBehavior: Clip.none,
        itemCount: orderProductsList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return DismissibleDeleteWidget(
            // TODO: UNIQUE KEY TO BE CHANGED with Product ID's.
            // TODO: orderProductsList[index].id,
            onDismissed: () => onDismissed(index),
            uniqueKey: '$index',
            dismissibleEnabled: dismissibleEnabled,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: paddingBetweenElements.w / 2,
                top: paddingBetweenElements.w / 2,
                left: paddingMain.w,
                right: paddingMain.w,
              ),
              child: useShimmer!
                  ? CardPlaceholderHorizontal(
                      cardHeight: cardHeight,
                      cardWidth: context.mediaQuery.size.width,
                    )
                  : Stack(
                      children: [
                        OrderProductCardHorizontalDetailed(
                          orderProduct: orderProductsList[index],
                          product: orderProductsList[index].selectedProduct,
                          isCardElevated: isCardElevated,
                          cardHeight: cardHeight,
                        ),
                        Positioned.fill(
                          right: 25.w,
                          bottom: 10.h,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: SwitchItemCounter(
                              itemCount: orderProductsList[index].itemCount,
                              onPressedMinus: onPressedMinus,
                              onPressedPlus: onPressedPlus,
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
