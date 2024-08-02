import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';
import 'package:shimmer/shimmer.dart';

class CardPlaceholder extends StatelessWidget {
  const CardPlaceholder({
    super.key,
    required this.cardWidth,
    required this.cardHeight,
  });

  final double cardWidth;
  final double cardHeight;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Shimmer.fromColors(
        baseColor: Colors.black54,
        highlightColor: Colors.black,
        enabled: true,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              Constants.kRadiusCardPrimary.r,
            ),
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
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Constants.kRadiusCardPrimary.r),
                      bottomLeft:
                          Radius.circular(Constants.kRadiusCardPrimary.r),
                      topRight: Radius.circular(Constants.kRadiusCardPrimary.r),
                      bottomRight:
                          Radius.circular(Constants.kRadiusCardPrimary.r),
                    ),
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: context.textTheme.bodyLarge!.fontSize!.h,
                              width: cardWidth / 2,
                              color: Colors.red,
                            ),
                          ],
                        ),
                        Container(
                          height: context.textTheme.bodyLarge!.fontSize!.h,
                          width: cardWidth / 7,
                          color: Colors.red,
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
