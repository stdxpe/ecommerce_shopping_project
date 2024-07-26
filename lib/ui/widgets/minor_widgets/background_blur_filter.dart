import 'package:flutter/material.dart';

import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/background_frosted_glass_blur_filter.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class BackgroundBlurFilter extends StatelessWidget {
  const BackgroundBlurFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.mediaQuery.size.width,
      height: context.mediaQuery.size.height,
      child: Stack(alignment: Alignment.center, children: [
        Container(
          width: context.mediaQuery.size.width,
          height: context.mediaQuery.size.height,
          color: Colors.white.withOpacity(0.2),
          child: Image.asset(
            AppImages.productImage0,
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
          ),
        ),
        const BackgroundFrostedGlassBlurFilter(blurPercent: 30.0),
      ]),
    );
  }
}
