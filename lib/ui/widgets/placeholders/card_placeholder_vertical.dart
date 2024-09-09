import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/ui_general_providers.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class CardPlaceholderVertical extends StatelessWidget {
  const CardPlaceholderVertical({super.key, required this.card});

  final VerticalCardOutputs card;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Shimmer.fromColors(
        baseColor: ColorPalette.shimmerBackground,
        highlightColor: ColorPalette.shimmerForeground,
        direction: ShimmerDirection.ltr,
        enabled: true,
        child: SizedBox(
          height: card.totalHeight,
          width: card.totalWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    top: card.paddingCardVertical,
                  ),

                  /// CARD TEXT SECTION
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: card.fontSizePrimary,
                        width: card.totalWidth,
                        color: context.colorPalette.scaffoldBackground,
                      ),
                      SizedBox(height: card.spacingBTWItemsVertical),
                      Container(
                        height: card.fontSizePrimary,
                        width: card.totalWidth,
                        color: context.colorPalette.scaffoldBackground,
                      ),
                      SizedBox(height: card.spacingBTWItemsVertical),
                      Container(
                        height: card.fontSizeSecondary,
                        width: card.totalWidth * 0.4,
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
