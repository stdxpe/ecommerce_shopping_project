import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/services/navigation_service.dart';
import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ProductCardDeals extends StatelessWidget {
  const ProductCardDeals({
    super.key,
    this.isCardElevated = false,
    required this.product,
    required this.cardHeight,
    required this.descriptionPrimary,
    required this.descriptionSecondary,
  });

  final Product product;
  final String descriptionPrimary;
  final String descriptionSecondary;
  final double cardHeight;
  final bool? isCardElevated;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(Routes.productDetails, extra: product);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30.w),
        height: cardHeight.h,
        width: 1.sw,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: const Color(0xFFEBEFF2),
          // ? const Color(0xFFF5F5F5),
          // ? context.colorPalette.cardBackground
          borderRadius: BorderRadius.circular(
            50.r,
            // Constants.kRadiusCardPrimary.r,
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
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      product.mainPhoto,
                    ),
                  ),
                ),
              ),
            ),

            /// CARD TEXTS
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 75.w,
                  right: 30.w,
                  top: 30.h,
                  bottom: 30.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextCustom(
                      text: '\$${product.price.toStringAsFixed(2)}',
                      textStyle: context.textTheme.bodyMedium!,
                      color: context.colorPalette.cardTextSecondary,
                      fontSizeCustom: 45,
                      fontWeightCustom: FontWeight.w600,
                    ),
                    SizedBox(height: 20.h),
                    TextCustom(
                      text: product.title,
                      textStyle: context.textTheme.bodyLarge!,
                      color: context.colorPalette.cardTextPrimary,
                      maxLines: 2,
                      fontHeightCustom: 1.1,
                      fontSizeCustom: 65,
                      fontWeightCustom: FontWeight.w700,
                      isHeightConstraintRelated: false,
                    ),
                    SizedBox(height: 20.h),
                    TextCustom(
                      text: descriptionPrimary,
                      textStyle: context.textTheme.bodySmall!,
                      color: context.colorPalette.cardTextTertiary,
                      fontSizeCustom: 40,
                      fontWeightCustom: FontWeight.w500,
                    ),
                    SizedBox(height: 5.h),
                    TextCustom(
                      text: descriptionSecondary,
                      textStyle: context.textTheme.bodySmall!,
                      color: context.colorPalette.cardTextTertiary,
                      fontSizeCustom: 35,
                      fontWeightCustom: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
