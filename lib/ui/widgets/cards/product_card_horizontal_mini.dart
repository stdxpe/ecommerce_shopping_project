import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ProductCardHorizontalMini extends StatelessWidget {
  const ProductCardHorizontalMini({
    super.key,
    required this.product,
    required this.cardWidth,
    required this.cardHeight,
    this.isCardElevated = true,
    this.useSoftShadow = false,
  });

  final Product product;
  final double cardWidth;
  final double cardHeight;
  final bool? isCardElevated;
  final bool? useSoftShadow;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: GestureDetector(
        onTap: () {
          context.push(Routes.productDetails, extra: product);
        },
        child: DecoratedBox(
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
                  color: useSoftShadow!
                      ? context.colorPalette.shadowPrimary.withOpacity(0.2)
                      : context.colorPalette.shadowPrimary,
                ),
            ],
          ),
          child: SizedBox(
            height: cardHeight.h,
            width: cardWidth,
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
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Constants.kRadiusCardPrimary.r),
                      bottomLeft:
                          Radius.circular(Constants.kRadiusCardPrimary.r),
                      topRight: Radius.circular(
                          isCardElevated! ? 0 : Constants.kRadiusCardPrimary.r),
                      bottomRight: Radius.circular(
                          isCardElevated! ? 0 : Constants.kRadiusCardPrimary.r),
                    ),
                    boxShadow: [
                      if (isCardElevated == false)
                        BoxShadows.kBoxShadowImage(
                          color: context.colorPalette.shadowPrimary,
                        ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                    padding: EdgeInsets.symmetric(
                      horizontal: Constants.kHorizontalCardPaddingHorizontal.w,
                      vertical: 0,
                    ),
                    height: cardHeight.h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 9,
                          child: TextCustom(
                            text: product.title,
                            textStyle: context.textTheme.bodyLarge!,
                            color: context.colorPalette.cardTextPrimary,
                            maxLines: 2,
                            isHeightConstraintRelated: false,
                          ),
                        ),
                        const Flexible(flex: 1, child: SizedBox(width: 0)),
                        TextCustom(
                          text: '\$${product.price.toStringAsFixed(2)}',
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
        ),
      ),
    );
  }
}
