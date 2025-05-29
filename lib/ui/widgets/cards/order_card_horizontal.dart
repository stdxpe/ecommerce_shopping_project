import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/models/order.dart';
import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/card_image.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class OrderCardHorizontal extends StatelessWidget {
  const OrderCardHorizontal({
    super.key,
    required this.order,
    required this.cardHeight,
    this.isCardElevated = true,
  });

  final Order order;
  final double cardHeight;
  final bool? isCardElevated;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: GestureDetector(
        onTap: () => context.push(Routes.trackingOrder, extra: order),
        child: Container(
          decoration: BoxDecoration(
            color: isCardElevated!
                ? context.colorPalette.cardBackground
                : Colors.transparent,
            borderRadius: BorderRadius.circular(Constants.kRadiusCardPrimary.r),
            boxShadow: [
              if (isCardElevated == true)
                BoxShadows.kBoxShadowProductCard(
                  color: context.colorPalette.shadowPrimary,
                ),
            ],
          ),
          child: SizedBox(
            height: cardHeight.h,
            child: Row(
              children: [
                /// CARD IMAGE
                CardImage(
                    useFadeInAnimation: true,
                    imageUrl: order.products.first.photo,
                    height: cardHeight.h,
                    width: cardHeight.h,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: context.colorPalette.scaffoldBackground,
                      borderRadius: BorderRadius.only(
                        topLeft:
                            Radius.circular(Constants.kRadiusCardPrimary.r),
                        bottomLeft:
                            Radius.circular(Constants.kRadiusCardPrimary.r),
                        topRight: Radius.circular(isCardElevated!
                            ? 0
                            : Constants.kRadiusCardPrimary.r),
                        bottomRight: Radius.circular(isCardElevated!
                            ? 0
                            : Constants.kRadiusCardPrimary.r),
                      ),
                      boxShadow: [
                        if (isCardElevated == false)
                          BoxShadows.kBoxShadowImage(
                            color: context.colorPalette.shadowPrimary,
                          ),
                      ],
                    )),

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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextCustom(
                                text:
                                    'Order ID: #${order.id.toUpperCase().split('-').first}',
                                textStyle: context.textTheme.bodyLarge!,
                                color: context.colorPalette.cardTextPrimary,
                              ),
                              Flexible(flex: 1, child: SizedBox(height: 15.h)),
                              TextCustom(
                                text:
                                    '${order.createdAt.formatDate},  ${order.totalItemCount.toString()} Product',
                                textStyle: context.textTheme.bodySmall!,
                                color: context.colorPalette.cardTextPrimary,
                                fontHeightCustom: 1.2,
                                fontSizeCustom: 34,
                              ),
                            ],
                          ),
                        ),
                        const Flexible(flex: 1, child: SizedBox(width: 0)),
                        TextCustom(
                          text: '\$${order.totalPrice.toStringAsFixed(2)}',
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
