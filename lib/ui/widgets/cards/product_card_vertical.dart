import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/ui_general_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/card_image.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({
    super.key,
    required this.product,
    required this.card,
    this.isCardElevated = false,
  });

  final Product product;
  final VerticalCardOutputs card;
  final bool? isCardElevated;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(Routes.productDetails, extra: product),
      child: Container(
        height: card.totalHeight,
        width: card.totalWidth,
        clipBehavior: isCardElevated! ? Clip.hardEdge : Clip.none,
        decoration: BoxDecoration(
          color: isCardElevated!
              ? context.colorPalette.cardBackground
              : Colors.transparent,
          borderRadius: BorderRadius.circular(
              isCardElevated! ? Constants.kRadiusCardPrimary.r : 0),
          boxShadow: [
            if (isCardElevated!)
              BoxShadows.kBoxShadowProductCard(
                  color: context.colorPalette.shadowPrimary),
          ],
        ),
        child: Column(
          children: [
            /// CARD IMAGE
            CardImage(
              imageUrl: product.mainPhoto,
              height: card.imageHeight,
              width: card.imageWidth,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: context.colorPalette.scaffoldBackground,
                borderRadius: BorderRadius.circular(
                  isCardElevated! ? 0 : Constants.kRadiusCardPrimary.r,
                ),
                boxShadow: [
                  if (isCardElevated == false)
                    BoxShadows.kBoxShadowProductCard(
                        color: context.colorPalette.shadowPrimary),
                ],
              ),
            ),

            /// CARD TEXT SECTION
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: card.paddingTextVertical,
                horizontal: isCardElevated!
                    ? card.paddingCardHorizontalIfElevated
                    : card.paddingCardHorizontal,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextCustom(
                    text: product.title,
                    textStyle: context.textTheme.bodyLarge!,
                    color: context.colorPalette.cardTextPrimary,
                    maxLines: 2,
                    isHeightConstraintRelated: false,
                  ),
                  SizedBox(height: card.paddingTextBetween),
                  TextCustom(
                    text: product.price.inUSD,
                    textStyle: context.textTheme.bodyMedium!,
                    color: context.colorPalette.cardTextSecondary,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ).animate(delay: 10.ms).fadeIn(duration: 300.ms);
  }
}
