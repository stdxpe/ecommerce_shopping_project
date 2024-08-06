import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';
import 'package:shimmer/shimmer.dart';

class CardPlaceholderStack extends StatelessWidget {
  const CardPlaceholderStack({
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
      child: Container(
        height: cardHeight.h,
        width: cardWidth.h,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius:
              BorderRadius.all(Radius.circular(Constants.kRadiusCardPrimary.r)),
        ),
      ),
    );
  }
}
