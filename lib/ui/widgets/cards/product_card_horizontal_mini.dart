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

class ProductCardHorizontalMini extends StatelessWidget {
  const ProductCardHorizontalMini({
    super.key,
    required this.product,
    required this.card,
    this.useSoftShadow = true,
    this.onPressed,
  });

  final Product product;
  final HorizontalCardOutputs card;
  final bool? useSoftShadow;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: GestureDetector(
        onTap: () {
          if (onPressed != null) {
            onPressed!();
            return;
          }
          context.push(Routes.productDetails, extra: product);
        },
        child: Container(
          height: card.totalHeight,
          width: card.totalWidth,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: context.colorPalette.cardBackground,
            borderRadius: BorderRadius.circular(Constants.kRadiusCardPrimary.r),
            boxShadow: [
              BoxShadows.kBoxShadowProductCard(
                color: useSoftShadow!
                    ? context.colorPalette.shadowPrimary.withOpacity(0.2)
                    : context.colorPalette.shadowPrimary,
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /// CARD IMAGE
              CardImage(
                  imageUrl: product.mainPhoto,
                  height: card.imageHeight,
                  width: card.imageWidth,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      color: context.colorPalette.scaffoldBackground)),

              /// CARD TEXT SECTION
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: card.paddingCardHorizontal, vertical: 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 12,
                        child: TextCustom(
                          text: product.title,
                          textStyle: context.textTheme.bodyLarge!,
                          color: context.colorPalette.cardTextPrimary,
                          maxLines: 2,
                          isHeightConstraintRelated: false,
                          fontHeightCustom: 1.15,
                        ),
                      ),
                      const Flexible(flex: 1, child: SizedBox(width: 0)),
                      TextCustom(
                        text: product.price.inUSD,
                        textStyle: context.textTheme.bodyMedium!,
                        color: context.colorPalette.cardTextSecondary,
                        textAlignCustom: TextAlign.end,
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
