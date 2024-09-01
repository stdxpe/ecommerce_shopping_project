import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/models/cart_product.dart';
import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class OrderProductCardHorizontalDetailed extends StatelessWidget {
  const OrderProductCardHorizontalDetailed({
    super.key,
    required this.orderProduct,
    required this.cardHeight,
    this.isCardElevated = false,
    this.useItemCounter = false,
  });

  final CartProduct orderProduct;
  final bool? useItemCounter;
  final double cardHeight;
  final bool? isCardElevated;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: GestureDetector(
        onTap: () => context.push(Routes.productDetails,
            extra: orderProduct.selectedProduct),
        child: Container(
          height: cardHeight.h,
          decoration: BoxDecoration(
            color: isCardElevated!
                ? context.colorPalette.cardBackground
                : Colors.transparent,
            borderRadius: BorderRadius.circular(
              Constants.kRadiusCardPrimary.r,
            ),
            boxShadow: [
              if (isCardElevated == true)
                BoxShadows.kBoxShadowProductCard(
                  color: context.colorPalette.shadowPrimary,
                ),
            ],
          ),
          child: Row(
            children: [
              /// CARD IMAGE
              Container(
                height: cardHeight.h,
                width: cardHeight.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      orderProduct.selectedProduct.mainPhoto,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(
                    Constants.kRadiusCardPrimary.r,
                  ),
                  boxShadow: [
                    if (isCardElevated == false)
                      BoxShadows.kBoxShadowImage(
                        color: context.colorPalette.shadowPrimary,
                      ),
                  ],
                ),
              ),

              /// CARD TEXTS
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical:
                        Constants.kHorizontalCardDetailedPaddingVertical.h,
                    horizontal:
                        Constants.kHorizontalCardDetailedPaddingHorizontal.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextCustom(
                            text: orderProduct.selectedProduct.title,
                            textStyle: context.textTheme.bodyLarge!,
                            color: context.colorPalette.cardTextPrimary,
                            maxLines: 2,
                            isHeightConstraintRelated: false,
                          ),
                          SizedBox(
                            height: Constants
                                .kHorizontalCardDetailedSpacingBTWItemsVertical
                                .h,
                          ),
                          TextCustom(
                            text:
                                '\$${orderProduct.selectedProduct.price.toStringAsFixed(2)}',
                            textStyle: context.textTheme.bodyMedium!,
                            color: context.colorPalette.cardTextSecondary,
                          ),
                        ],
                      ),
                      TextCustom(
                        text: useItemCounter!
                            ? 'Size: ${orderProduct.selectedSize}  |  Color: ${orderProduct.selectedColor}'
                            : 'Size: ${orderProduct.selectedSize}  |  Color: ${orderProduct.selectedColor}  |  ${orderProduct.itemCount}x',
                        textStyle: context.textTheme.bodySmall!,
                        color: context.colorPalette.cardTextTertiary,
                        fontWeightCustom: FontWeight.w400,
                        fontSizeCustom: 32,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
