import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/models/order_product.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/ui_general_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/card_image.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class OrderCardHorizontalDetailed extends StatelessWidget {
  const OrderCardHorizontalDetailed(
      {super.key, required this.orderProduct, required this.card});

  final OrderProduct orderProduct;
  final HorizontalDetailedCardOutputs card;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: SizedBox(
        height: card.totalHeight,
        width: card.totalWidth,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /// CARD IMAGE
            CardImage(
              imageUrl: orderProduct.photo,
              height: card.imageHeight,
              width: card.imageWidth,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  color: context.colorPalette.scaffoldBackground,
                  borderRadius:
                      BorderRadius.circular(Constants.kRadiusCardPrimary.r),
                  boxShadow: [
                    BoxShadows.kBoxShadowProductCard(
                        color: context.colorPalette.shadowPrimary),
                  ]),
            ),

            SizedBox(width: 12.5.w),

            /// CARD TEXT SECTION
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: card.paddingCardHorizontal,
                    vertical: card.paddingCardVertical),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextCustom(
                          text: orderProduct.title,
                          textStyle: context.textTheme.bodyLarge!,
                          color: context.colorPalette.cardTextPrimary,
                          maxLines: 2,
                          isHeightConstraintRelated: false,
                          fontHeightCustom: 1.1,
                          fontSizeCustom: 40,
                        ),
                        SizedBox(height: card.spacingBTWTextsVertical),
                        TextCustom(
                          text: orderProduct.price.inUSD,
                          textStyle: context.textTheme.bodyMedium!,
                          color: context.colorPalette.cardTextSecondary,
                          fontSizeCustom: 38,
                        ),
                      ],
                    ),
                    TextCustom(
                      text:
                          'Size: ${orderProduct.selectedSize}  |  Color: ${orderProduct.selectedColor}  |  ${orderProduct.itemCount}x',
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
      ).animate(delay: 10.ms).fadeIn(duration: 300.ms),
    );
  }
}
