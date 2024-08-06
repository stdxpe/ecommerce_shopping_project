import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';
import 'package:shimmer/shimmer.dart';

class CardPlaceholderHorizontal extends StatelessWidget {
  const CardPlaceholderHorizontal({
    super.key,
    required this.cardWidth,
    required this.cardHeight,
  });

  final double cardWidth;
  final double cardHeight;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorPalette.shimmerBackground,
      highlightColor: ColorPalette.shimmerForeground,
      direction: ShimmerDirection.ltr,
      enabled: true,
      child: SizedBox(
        height: cardHeight.h,
        width: cardWidth,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: cardHeight.h,
              width: cardHeight.h,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(
                    Radius.circular(Constants.kRadiusCardPrimary.r)),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: Constants.kHorizontalCardPaddingHorizontal.w,
                  top: 10.h,
                  bottom: 15.h,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: context.textTheme.bodyLarge!.fontSize!.h,
                            width: (cardWidth -
                                    cardHeight.h -
                                    Constants
                                        .kHorizontalCardPaddingHorizontal.w) *
                                0.91,
                            //     cardWidth / 10,
                            color: Colors.black),
                        SizedBox(height: 15.h),
                        Container(
                          height: context.textTheme.bodyLarge!.fontSize!.h,
                          width: (cardWidth -
                                  cardHeight.h -
                                  Constants
                                      .kHorizontalCardPaddingHorizontal.w) *
                              0.80,
                          color: Colors.black,
                        ),
                      ],
                    ),

                    // SizedBox(height: 30.h),
                    Container(
                        height: context.textTheme.bodyLarge!.fontSize!.h,
                        width: (cardWidth -
                                cardHeight.h -
                                Constants.kHorizontalCardPaddingHorizontal.w) *
                            0.25,
                        color: Colors.black),
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
