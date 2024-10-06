import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class CardPlaceholderStandart extends StatelessWidget {
  const CardPlaceholderStandart(
      {super.key, required this.height, required this.width});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Shimmer.fromColors(
        baseColor: ColorPalette.shimmerBackground,
        highlightColor: ColorPalette.shimmerForeground,
        direction: ShimmerDirection.ltr,
        enabled: true,
        child: Container(
          color: Colors.transparent,
          height: height,
          width: width,
        ),
      ),
    );
  }
}
