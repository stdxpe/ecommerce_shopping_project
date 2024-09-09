import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/ui_general_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class CardErrorVertical extends StatelessWidget {
  const CardErrorVertical({super.key, required this.card});

  final VerticalCardOutputs card;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: card.totalHeight,
      width: card.totalWidth,
      decoration: BoxDecoration(
          color: context.colorPalette.cardBackground,
          borderRadius:
              BorderRadius.all(Radius.circular(Constants.kRadiusCardPrimary.r)),
          boxShadow: [
            BoxShadows.kBoxShadowProductCard(
                color: context.colorPalette.shadowPrimary)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_rounded,
            size: 125.h,
            color: context.colorPalette.text.withOpacity(0.7),
          ),
          SizedBox(height: 35.h),
          TextCustom(
            text: AppStrings.globalStateErrorMessage,
            color: context.colorPalette.text.withOpacity(0.6),
            textStyle: context.textTheme.bodyMedium!,
            maxLines: 2,
            fontHeightCustom: 1.2,
            fontSizeCustom: 32,
            fontWeightCustom: FontWeight.w600,
            textAlignCustom: TextAlign.center,
          ),
        ],
      ).animate().fadeIn(
            duration: 500.ms,
          ),
    );
  }
}
