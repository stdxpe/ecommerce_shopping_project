import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';
import 'package:shimmer/shimmer.dart';

class CardPlaceholderVertical extends StatelessWidget {
  const CardPlaceholderVertical({
    super.key,
    required this.cardWidth,
    this.useDoubleLine = true,
  });

  final double cardWidth;
  final bool? useDoubleLine;

  @override
  Widget build(BuildContext context) {
    double fontSizePrimary = (context.textTheme.bodyLarge!.fontSize!.h *
            context.textTheme.bodyLarge!.height!) *
        (useDoubleLine! ? 2 : 1);
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
    return Shimmer.fromColors(
      baseColor: ColorPalette.shimmerBackground,
      highlightColor: ColorPalette.shimmerForeground,
      direction: ShimmerDirection.ltr,
      enabled: true,
      child: SizedBox(
        height: cardTotalHeight,
        width: cardTotalWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: cardTotalWidth,
              width: cardTotalWidth,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(
                    Radius.circular(Constants.kRadiusCardPrimary.r)),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: Constants.kVerticalCardPaddingVertical.h,
                  horizontal: Constants.kVerticalCardPaddingHorizontal.w,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: context.textTheme.bodyLarge!.fontSize!.h,
                        width: cardTotalWidth,
                        color: Colors.black),
                    SizedBox(
                        height:
                            Constants.kVerticalCardSpacingBTWItemsVertical.h),
                    if (useDoubleLine!)
                      Container(
                          height: context.textTheme.bodyLarge!.fontSize!.h,
                          width: cardTotalWidth,
                          color: Colors.black),
                    if (useDoubleLine!)
                      SizedBox(
                          height:
                              Constants.kVerticalCardSpacingBTWItemsVertical.h),
                    Container(
                        height: context.textTheme.bodyMedium!.fontSize!.h,
                        width: cardTotalWidth * 0.4,
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
