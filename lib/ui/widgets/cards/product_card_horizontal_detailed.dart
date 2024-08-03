import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/app_router.dart';
import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ProductCardHorizontalDetailed extends StatelessWidget {
  const ProductCardHorizontalDetailed({
    super.key,
    required this.product,
    required this.bottomInfo,
    required this.cardHeight,
    this.isCardElevated = false,
  });

  final Product product;
  final String bottomInfo;
  final double cardHeight;
  final bool? isCardElevated;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: GestureDetector(
        onTap: () {
          context.push(Routes.productDetails, extra: product);
        },
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
                    image: AssetImage(
                      product.mainPhoto,
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
                            text: product.title,
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
                            text: '\$${product.price.toStringAsFixed(2)}',
                            textStyle: context.textTheme.bodyMedium!,
                            color: context.colorPalette.cardTextSecondary,
                          ),
                        ],
                      ),
                      TextCustom(
                        text: bottomInfo,
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
