import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/app_router.dart';
import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ProductCardStack extends StatelessWidget {
  const ProductCardStack({
    super.key,
    required this.product,
    this.bottomText,
    required this.cardWidth,
  });
  final Product product;
  final String? bottomText;
  final double cardWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(Routes.productDetails, extra: product);
      },
      child: Align(
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              Constants.kRadiusCardPrimary.r,
            ),
            boxShadow: [
              BoxShadows.kBoxShadowProductCard(
                color: context.colorPalette.shadowPrimary,
              ),
            ],
          ),
          child: Container(
            height: cardWidth.w,
            width: cardWidth.w,
            padding: EdgeInsets.only(
              top: Constants.kStackCardPaddingVertical.h,
              bottom: Constants.kStackCardPaddingVertical.h,
              left: Constants.kStackCardPaddingHorizontal.w,
              right: Constants.kStackCardPaddingHorizontal.w,
            ),
            decoration: BoxDecoration(
              // color: Colors.green.withOpacity(0.5),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  product.mainPhoto,
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
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
                        height: Constants.kStackCardSpacingBTWItemsVertical.h),
                    TextCustom(
                      text: '\$${product.price.toStringAsFixed(2)}',
                      textStyle: context.textTheme.bodyMedium!,
                      color: context.colorPalette.cardTextSecondary,
                    ),
                  ],
                ),
                if (bottomText != null)
                  TextCustom(
                    text: bottomText!,
                    textStyle: context.textTheme.bodySmall!,
                    color: context.colorPalette.cardTextTertiary,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
