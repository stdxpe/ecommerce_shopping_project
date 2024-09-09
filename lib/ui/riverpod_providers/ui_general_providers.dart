import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

typedef VerticalCardInputs = ({
  double cardWidth,
  int? itemCountOnRow,
  BuildContext ctx
});

typedef VerticalCardOutputs = ({
  double totalHeight,
  double totalWidth,
  double imageHeight,
  double imageWidth,
  double textSectionHeight,
  double paddingTextVertical,
  double paddingTextBetween,
  double paddingCardVertical,
  double paddingCardHorizontal,
  double paddingCardHorizontalIfElevated,
  double spacingBTWItemsVertical,
  double spacingBTWCardsHorizontal,
  double spacingBTWCardsVertical,
  double fontSizePrimary,
  double fontSizeSecondary,
  double fontHeightPrimary,
  double fontHeightSecondary,
});

final verticalCard =
    Provider.family<VerticalCardOutputs, VerticalCardInputs>((ref, params) {
  double fontHeightPrimary = (params.ctx.textTheme.bodyLarge!.fontSize!.h *
          params.ctx.textTheme.bodyLarge!.height!) *
      2;
  double fontHeightSecondary = params.ctx.textTheme.bodyMedium!.fontSize!.h *
      params.ctx.textTheme.bodyMedium!.height!;

  double paddingTextVertical = Constants.kVerticalCardPaddingVertical.h;

  double paddingTextBetween = Constants.kVerticalCardSpacingBTWItemsVertical.h;

  double textSectionHeight = paddingTextVertical +
      fontHeightPrimary +
      fontHeightSecondary +
      paddingTextBetween +
      paddingTextVertical;

  double cardTotalWidth = params.cardWidth.w;

  if (params.itemCountOnRow != null) {
    double paddingMain = Constants.kMainPaddingHorizontal.w;
    double paddingBetweenElements = Constants.kMainSpacingBTWCardsHorizontal.w;

    double totalPadding = (2 * paddingMain) +
        ((params.itemCountOnRow! - 1) * paddingBetweenElements);

    cardTotalWidth = (params.ctx.mediaQuery.size.width - totalPadding) /
        params.itemCountOnRow!;
  }
  double cardTotalHeight = cardTotalWidth + textSectionHeight;

  return (
    totalHeight: cardTotalHeight,
    totalWidth: cardTotalWidth,
    imageHeight: cardTotalWidth,
    imageWidth: cardTotalWidth,
    textSectionHeight: textSectionHeight,
    paddingTextVertical: paddingTextVertical,
    paddingTextBetween: paddingTextBetween,
    paddingCardVertical: Constants.kVerticalCardPaddingVertical.h,
    paddingCardHorizontal: Constants.kVerticalCardPaddingHorizontal.w,
    paddingCardHorizontalIfElevated:
        Constants.kVerticalCardPaddingHorizontalIfElevated.w,
    spacingBTWItemsVertical: Constants.kVerticalCardSpacingBTWItemsVertical.h,
    spacingBTWCardsHorizontal: Constants.kMainSpacingBTWCardsHorizontal.w,
    spacingBTWCardsVertical: Constants.kMainSpacingBTWCardsVertical.w,
    fontSizePrimary: params.ctx.textTheme.bodyLarge!.fontSize!.h,
    fontSizeSecondary: params.ctx.textTheme.bodyMedium!.fontSize!.h,
    fontHeightPrimary: fontHeightPrimary,
    fontHeightSecondary: fontHeightSecondary,
  );
});

typedef HorizontalCardInputs = ({
  double? cardWidth,
  double? cardHeight,
  BuildContext ctx,
});

typedef HorizontalCardOutputs = ({
  double totalHeight,
  double totalWidth,
  double imageHeight,
  double imageWidth,
  double paddingCardHorizontal,
  double spacingBTWCardsVertical,
  double spacingBTWTextsVertical,
  double fontSizePrimary,
  double fontSizeSecondary,
  double fontHeightPrimary,
  double fontHeightSecondary,
  double placeholderTextWidthPrimary,
  double placeholderTextWidthSecondary,
  double placeholderTextWidthTertiary,
});

final horizontalCard =
    Provider.family<HorizontalCardOutputs, HorizontalCardInputs>((ref, params) {
  double fontHeightPrimary = (params.ctx.textTheme.bodyLarge!.fontSize!.h *
          params.ctx.textTheme.bodyLarge!.height!) *
      2;
  double fontHeightSecondary = params.ctx.textTheme.bodyMedium!.fontSize!.h *
      params.ctx.textTheme.bodyMedium!.height!;

  double cardTotalHeight = params.cardHeight?.w ?? 200.w;

  double cardTotalWidth =
      params.cardWidth?.w ?? params.ctx.mediaQuery.size.width;

  double placeholderTextWidthPrimary = (cardTotalWidth -
          cardTotalHeight -
          Constants.kHorizontalCardPaddingHorizontal.w) *
      1;

  double placeholderTextWidthSecondary = (cardTotalWidth -
          cardTotalHeight -
          Constants.kHorizontalCardPaddingHorizontal.w) *
      0.85;

  double placeholderTextWidthTertiary = (cardTotalWidth -
          cardTotalHeight -
          Constants.kHorizontalCardPaddingHorizontal.w) *
      0.3;

  return (
    totalHeight: cardTotalHeight,
    totalWidth: cardTotalWidth,
    imageHeight: cardTotalHeight,
    imageWidth: cardTotalHeight,
    paddingCardHorizontal: Constants.kHorizontalCardPaddingHorizontal.w,
    spacingBTWCardsVertical: Constants.kMainSpacingBTWCardsVertical.w,
    spacingBTWTextsVertical: Constants.kHorizontalCardSpacingBTWItemsVertical.h,
    fontSizePrimary: params.ctx.textTheme.bodyLarge!.fontSize!.h,
    fontSizeSecondary: params.ctx.textTheme.bodyMedium!.fontSize!.h,
    fontHeightPrimary: fontHeightPrimary,
    fontHeightSecondary: fontHeightSecondary,
    placeholderTextWidthPrimary: placeholderTextWidthPrimary,
    placeholderTextWidthSecondary: placeholderTextWidthSecondary,
    placeholderTextWidthTertiary: placeholderTextWidthTertiary,
  );
});

typedef HorizontalDetailedCardInputs = ({double cardHeight, BuildContext ctx});

typedef HorizontalDetailedCardOutputs = ({
  double totalHeight,
  double totalWidth,
  double imageHeight,
  double imageWidth,
  double paddingCardHorizontal,
  double paddingCardVertical,
  double spacingBTWTextsVertical,
  double spacingBTWCardsVertical,
});

final horizontalDetailedCard = Provider.family<HorizontalDetailedCardOutputs,
    HorizontalDetailedCardInputs>((ref, params) {
  double cardTotalHeight = params.cardHeight.w;

  double cardTotalWidth = params.ctx.mediaQuery.size.width;

  return (
    totalHeight: cardTotalHeight,
    totalWidth: cardTotalWidth,
    imageHeight: cardTotalHeight,
    imageWidth: cardTotalHeight,
    paddingCardHorizontal: Constants.kHorizontalCardDetailedPaddingHorizontal.w,
    paddingCardVertical: Constants.kHorizontalCardDetailedPaddingVertical.w,
    spacingBTWCardsVertical: Constants.kMainSpacingBTWCardsVertical.w,
    spacingBTWTextsVertical:
        Constants.kHorizontalCardDetailedSpacingBTWItemsVertical.w,
  );
});
