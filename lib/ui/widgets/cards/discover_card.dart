import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class DiscoverCard extends StatelessWidget {
  const DiscoverCard({
    super.key,
    required this.photo,
    this.useShadow = true,
    this.onPressed,
  });

  final String photo;
  final bool? useShadow;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: GestureDetector(
        onTap: () {
          if (onPressed != null) onPressed!();
        },
        child: Container(
          margin: EdgeInsets.only(
            bottom: Constants.kDetailsSpacingBTWItemsVertical.h,
            left: Constants.kMainPaddingHorizontal.w,
            right: Constants.kMainPaddingHorizontal.w,
          ),
          width: context.mediaQuery.size.width,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: context.colorPalette.scaffoldBackground,
              borderRadius:
                  BorderRadius.circular(Constants.kRadiusCardPrimary.r),
              boxShadow: [
                if (useShadow!)
                  BoxShadows.kBoxShadowProductCard(
                    color: context.colorPalette.shadowPrimary,
                  )
              ]),
          child: Image.asset(photo, fit: BoxFit.fitWidth),
        ).animate().fadeIn(duration: 750.ms),
      ),
    );
  }
}
