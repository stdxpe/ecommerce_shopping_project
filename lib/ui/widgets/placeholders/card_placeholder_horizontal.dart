import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/ui_general_providers.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class CardPlaceholderHorizontal extends StatelessWidget {
  const CardPlaceholderHorizontal({super.key, required this.card});

  final HorizontalCardOutputs card;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Shimmer.fromColors(
        baseColor: ColorPalette.shimmerBackground,
        highlightColor: ColorPalette.shimmerForeground,
        direction: ShimmerDirection.ltr,
        enabled: true,
        child: Container(
          margin: EdgeInsets.only(bottom: card.spacingBTWCardsVertical),
          height: card.totalHeight,
          width: card.totalWidth,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              /// CARD IMAGE
              Container(
                  height: card.imageHeight,
                  width: card.imageWidth,
                  decoration: BoxDecoration(
                      color: context.colorPalette.scaffoldBackground,
                      borderRadius: BorderRadius.all(
                          Radius.circular(Constants.kRadiusCardPrimary.r)))),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: card.paddingCardHorizontal,
                    right: card.paddingCardHorizontal,
                    top: 10.h,
                    bottom: 15.h,
                  ),

                  /// CARD TEXT SECTION
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: card.fontSizePrimary,
                            width: card.placeholderTextWidthPrimary,
                            color: context.colorPalette.scaffoldBackground,
                          ),
                          SizedBox(height: card.spacingBTWTextsVertical),
                          Container(
                            height: card.fontSizePrimary,
                            width: card.placeholderTextWidthSecondary,
                            color: context.colorPalette.scaffoldBackground,
                          ),
                        ],
                      ),
                      Container(
                        height: card.fontSizeSecondary,
                        width: card.placeholderTextWidthTertiary,
                        color: context.colorPalette.scaffoldBackground,
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
