import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ProductCardStack extends StatelessWidget {
  const ProductCardStack({
    super.key,
    required this.product,
    this.bottomText,
    required this.onPressed,
    required this.cardWidth,
  });
  final Product product;
  final String? bottomText;
  final Function onPressed;
  final double cardWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Align(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              Constants.kRadiusCardPrimary.r,
            ),
            boxShadow: [
              BoxShadows.kBoxShadowProductCard(
                color: context.theme.colorPalette.shadowPrimary,
              ),
            ],
          ),
          child: Card(
            elevation: 2,
            margin: EdgeInsets.zero,
            borderOnForeground: true,
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                Constants.kRadiusCardPrimary.r,
              ),
            ),
            child: Container(
              height: cardWidth.w,
              width: cardWidth.w,
              padding: EdgeInsets.only(
                top: Constants.kPaddingStackCardContentTop.h,
                bottom: Constants.kPaddingStackCardContentTop.h,
                left: Constants.kPaddingStackCardContentLeft.w,
                right: Constants.kPaddingStackCardContentLeft.w,
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
                      Text(
                        product.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: context.theme.textTheme.bodyLarge!.copyWith(
                          color: context.theme.colorPalette.cardTextPrimary,
                          fontSize: 47.sp,
                          shadows: [
                            BoxShadows.kBoxShadowProductCardText(
                              color: context.theme.colorPalette.permaWhiteColor
                                  .withOpacity(0.54),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                          height: Constants.kPaddingStackCardContentsBetween.h),
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.theme.textTheme.bodyMedium!.copyWith(
                          color: context.theme.colorPalette.cardTextSecondary,
                          fontSize: 37.sp,
                          shadows: [
                            BoxShadows.kBoxShadowProductCardText(
                              color: context.theme.colorPalette.permaWhiteColor
                                  .withOpacity(0.1),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (bottomText != null)
                    Text(
                      bottomText!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.theme.textTheme.bodySmall!.copyWith(
                        color: context.theme.colorPalette.cardTextTertiary,
                        fontSize: 37.sp,
                        shadows: [
                          BoxShadows.kBoxShadowProductCardText(
                            color: context.theme.colorPalette.permaWhiteColor
                                .withOpacity(0.2),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
