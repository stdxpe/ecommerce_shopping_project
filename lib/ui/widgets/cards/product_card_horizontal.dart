import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/services/navigation_service.dart';
import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({
    super.key,
    required this.product,
    required this.cardWidth,
    required this.cardHeight,
    this.isCardElevated = true,
  });

  final Product product;
  final double cardWidth;
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
          decoration: BoxDecoration(
            color: isCardElevated!
                ? context.colorPalette.cardBackground
                : Colors.transparent,
            // : Colors.red.withOpacity(0.5),
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
          child: Container(
            height: cardHeight.h,
            width: cardWidth.w,
            clipBehavior: Clip.none,
            color: Colors.transparent,
            child: Row(
              children: [
                /// CARD IMAGE
                Container(
                  height: cardHeight.h,
                  width: cardHeight.h,
                  decoration: BoxDecoration(
                    // color: Colors.green.withOpacity(0.5),
                    color: Colors.transparent,
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
                        BoxShadows.kBoxShadowProductCard(
                          color: context.colorPalette.shadowPrimary,
                        ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Constants.kHorizontalCardPaddingHorizontal.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
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
                                .kHorizontalCardSpacingBTWItemsVertical.h),
                        TextCustom(
                          text: '\$${product.price.toStringAsFixed(2)}',
                          textStyle: context.textTheme.bodyMedium!,
                          color: context.colorPalette.cardTextSecondary,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
