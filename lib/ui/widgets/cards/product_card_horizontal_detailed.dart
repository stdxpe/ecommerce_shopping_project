import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/models/cart_product.dart';
import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/ui_general_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/card_image.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ProductCardHorizontalDetailed extends StatelessWidget {
  const ProductCardHorizontalDetailed({
    super.key,
    required this.cartProduct,
    required this.card,
    this.useItemCounter = false,
  });

  final CartProduct cartProduct;
  final HorizontalDetailedCardOutputs card;
  final bool? useItemCounter;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: GestureDetector(
        onTap: () => context.push(Routes.productDetails,
            extra: cartProduct.selectedProduct),
        child: SizedBox(
          height: card.totalHeight,
          width: card.totalWidth,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /// CARD IMAGE
              CardImage(
                imageUrl: cartProduct.selectedProduct.mainPhoto,
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
                            text: cartProduct.selectedProduct.title,
                            textStyle: context.textTheme.bodyLarge!,
                            color: context.colorPalette.cardTextPrimary,
                            maxLines: 2,
                            isHeightConstraintRelated: false,
                            fontHeightCustom: 1.15,
                          ),
                          SizedBox(height: card.spacingBTWTextsVertical),
                          TextCustom(
                            text: cartProduct.selectedProduct.price.inUSD,
                            textStyle: context.textTheme.bodyMedium!,
                            color: context.colorPalette.cardTextSecondary,
                            textAlignCustom: TextAlign.end,
                          ),
                        ],
                      ),
                      TextCustom(
                        text: useItemCounter!
                            ? 'Size: ${cartProduct.selectedSize}  |  Color: ${cartProduct.selectedColor}'
                            : 'Size: ${cartProduct.selectedSize}  |  Color: ${cartProduct.selectedColor}  |  ${cartProduct.itemCount}x',
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
      ).animate(delay: 10.ms).fadeIn(duration: 300.ms),
    );
  }
}
