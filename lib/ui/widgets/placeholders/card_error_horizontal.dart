import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/ui_general_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class CardErrorHorizontal extends StatelessWidget {
  const CardErrorHorizontal({super.key, required this.card});

  final HorizontalCardOutputs card;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        margin: EdgeInsets.only(bottom: card.spacingBTWCardsVertical),
        height: card.totalHeight,
        width: card.totalWidth,
        decoration: BoxDecoration(
            color: context.colorPalette.cardBackground,
            borderRadius: BorderRadius.all(
                Radius.circular(Constants.kRadiusCardPrimary.r)),
            boxShadow: [
              BoxShadows.kBoxShadowProductCard(
                  color: context.colorPalette.shadowPrimary)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.error_rounded,
              size: 125.h,
              color: context.colorPalette.text.withOpacity(0.7),
            ),
            SizedBox(width: card.paddingCardHorizontal),
            TextCustom(
              text: AppStrings.globalStateErrorMessage,
              color: context.colorPalette.text.withOpacity(0.6),
              textStyle: context.textTheme.bodyMedium!,
              maxLines: 2,
              fontHeightCustom: 1.2,
              fontSizeCustom: 32,
              fontWeightCustom: FontWeight.w500,
              textAlignCustom: TextAlign.start,
            ),
          ],
        ).animate().fadeIn(duration: 500.ms),
      ),
    );
  }
}
