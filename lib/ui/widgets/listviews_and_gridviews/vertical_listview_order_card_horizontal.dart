import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/models/order.dart';
import 'package:ecommerce_shopping_project/ui/widgets/cards/order_card_horizontal.dart';

class VerticalListviewOrderCardHorizontal extends StatelessWidget {
  const VerticalListviewOrderCardHorizontal({
    super.key,
    required this.ordersList,
    required this.cardHeight,
    this.isCardElevated = true,
    required this.paddingMain,
    required this.paddingBetweenElements,
  });

  final List<Order> ordersList;
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
        itemCount: ordersList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: paddingBetweenElements.h),
            child: OrderCardHorizontal(
              order: ordersList[index],
              isCardElevated: isCardElevated,
              cardHeight: cardHeight,
            ),
          );
        },
      ),
    );
  }
}
