import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class BackgroundFrostedGlassBlurFilter extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? blurColor;
  final double? blurColorTransparency;
  final double? blurPercent;

  const BackgroundFrostedGlassBlurFilter({
    this.height,
    this.width,
    this.blurPercent,
    this.blurColor,
    this.blurColorTransparency = 0.3,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: blurPercent ?? 10.0,
          sigmaY: blurPercent ?? 10.0,
        ),
        child: Container(
          width: width ?? context.mediaQuery.size.width,
          height: height ?? context.mediaQuery.size.height,
          decoration: BoxDecoration(
            color: Colors.grey.shade200.withOpacity(blurColorTransparency!),

            // color: blurColor!.withOpacity(blurColorTransparency!),
          ),
        ),
      ),
    );
  }
}
