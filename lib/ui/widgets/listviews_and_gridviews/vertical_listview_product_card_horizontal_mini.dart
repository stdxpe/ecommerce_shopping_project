import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/ui/widgets/cards/product_card_horizontal_mini.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/dismissible_delete_widget.dart';

class VerticalListviewProductCardHorizontalMini extends StatelessWidget {
  const VerticalListviewProductCardHorizontalMini({
    super.key,
    required this.productsList,
    required this.cardHeight,
    this.isCardElevated = true,
    this.useSoftShadow = false,
    required this.paddingMain,
    required this.paddingBetweenElements,
    this.dismissibleEnabled = false,
  });

  final List<Product> productsList;
  final double cardHeight;
  final bool? isCardElevated;
  final bool? useSoftShadow;
  final double paddingMain;
  final double paddingBetweenElements;
  final bool? dismissibleEnabled;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const ClampingScrollPhysics(),
      clipBehavior: Clip.none,
      itemCount: productsList.length,
      scrollDirection: Axis.vertical,
      // itemExtent: cardHeight.h + paddingBetweenElements.w,
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
            child: ProductCardHorizontalMini(
              product: productsList[index],
              isCardElevated: isCardElevated,
              useSoftShadow: useSoftShadow,
              cardWidth: 1.sw,
              cardHeight: cardHeight,
            ),
          ),
        );
      },
    );
  }
}
