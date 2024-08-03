import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/app_router.dart';
import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({
    super.key,
    required this.product,
    required this.cardWidth,
    this.isCardElevated = false,
    this.maxLineCount = 1,
  });

  final Product product;
  final double cardWidth;
  final bool? isCardElevated;
  final int? maxLineCount;

  @override
  Widget build(BuildContext context) {
    double fontSizePrimary = (context.textTheme.bodyLarge!.fontSize!.h *
            context.textTheme.bodyLarge!.height!) *
        maxLineCount!;
    double fontSizeSecondary = (context.textTheme.bodyMedium!.fontSize!.h) *
        context.textTheme.bodyMedium!.height!;
    double paddingTextVertical = Constants.kVerticalCardPaddingVertical.h;
    double paddingTextBetween =
        Constants.kVerticalCardSpacingBTWItemsVertical.h;

    double textSectionHeight = paddingTextVertical +
        fontSizePrimary +
        paddingTextBetween +
        fontSizeSecondary +
        paddingTextVertical;

    double cardTotalWidth = cardWidth.w;

    double cardTotalHeight = cardTotalWidth + textSectionHeight;

    return Align(
      alignment: Alignment.topCenter,
      child: GestureDetector(
        onTap: () {
          context.push(Routes.productDetails, extra: product);
        },
        child: Container(
          height: cardTotalHeight,
          width: cardTotalWidth,
          clipBehavior: isCardElevated! ? Clip.hardEdge : Clip.none,
          decoration: BoxDecoration(
            color: isCardElevated!
                ? context.colorPalette.cardBackground
                : Colors.transparent,
            borderRadius: BorderRadius.circular(
              isCardElevated! ? Constants.kRadiusCardPrimary.r : 0.r,
            ),
            boxShadow: [
              if (isCardElevated!)
                BoxShadows.kBoxShadowProductCard(
                  color: context.colorPalette.shadowPrimary,
                ),
            ],
          ),
          child: Column(
            children: [
              /// CARD IMAGE
              Container(
                clipBehavior: Clip.hardEdge,
                height: cardTotalWidth,
                width: cardTotalWidth,
                decoration: BoxDecoration(
                  // color: Colors.green.withOpacity(0.5),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      product.mainPhoto,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(
                    isCardElevated! ? 0 : Constants.kRadiusCardPrimary.r,
                  ),
                  boxShadow: [
                    if (isCardElevated == false)
                      BoxShadows.kBoxShadowImage(
                        color: context.colorPalette.shadowPrimary,
                      ),
                  ],
                ),
              ),

              /// CARD TEXT SECTION
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: paddingTextVertical,
                  horizontal: isCardElevated!
                      ? Constants.kVerticalCardPaddingHorizontalIfElevated.w
                      : Constants.kVerticalCardPaddingHorizontal.w,
                ),
                height: textSectionHeight,
                width: cardTotalWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextCustom(
                      text: product.title,
                      textStyle: context.textTheme.bodyLarge!,
                      color: context.colorPalette.cardTextPrimary,
                      maxLines: maxLineCount,
                      isHeightConstraintRelated: false,
                    ),
                    SizedBox(height: paddingTextBetween),
                    TextCustom(
                      text: '\$${product.price.toStringAsFixed(2)}',
                      textStyle: context.textTheme.bodyMedium!,
                      color: context.colorPalette.cardTextSecondary,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
