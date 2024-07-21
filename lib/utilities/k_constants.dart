part of 'utilities_library_imports.dart';

/// [APP WIDE GLOBAL VARIABLE]

abstract class Constants {
  /// GLOBAL PADDINGS
  /// Naming Convention:  k + Item + Padding/Spacing + (BTW+Item) +  Direction

  /// All Screens
  static const double kMainPaddingHorizontal = 15;
  static const double kMainSpacingBTWCardsHorizontal = 30;
  static const double kMainSpacingBTWCardsVertical = 30;

  /// Main Title
  static const double kMainTitlePaddingTop = 20;
  static const double kMainTitlePaddingTopForHomeScreen = 77;
  static const double kMainTitlePaddingBottom = 60;
  static const double kMainTitleSpacingBTWItemsFoundBTWStepsVertical = 10;
  static const double kAppTitleSpacingBTWAppSubtitleVertical = 25;

  /// Button
  static const double kButtonPaddingHorizontal = 90;
  static const double kButtonPaddingTop = 60;
  static const double kButtonPaddingBottom = 50;

  /// Vertical Product Card
  static const double kVerticalCardPaddingVertical = 40;
  static const double kVerticalCardPaddingHorizontal = 5;
  static const double kVerticalCardPaddingHorizontalIfElevated = 30;
  static const double kVerticalCardSpacingBTWItemsVertical = 12;

  /// Horizontal Product Card
  static const double kHorizontalCardPaddingVertical = 40;
  static const double kHorizontalCardPaddingHorizontal = 40;
  static const double kHorizontalCardSpacingBTWItemsVertical = 15;

  /// Horizontal Product Card - Detailed
  static const double kHorizontalCardDetailedPaddingVertical = 10;
  static const double kHorizontalCardDetailedPaddingHorizontal = 30;
  static const double kHorizontalCardDetailedSpacingBTWItemsVertical = 20;

  /// Stack Product Card
  static const double kStackCardPaddingVertical = 60;
  static const double kStackCardPaddingHorizontal = 50;
  static const double kStackCardSpacingBTWItemsVertical = 11;

  /// Details Screen Related
  static const double kDetailsScreenTitlePaddingTop = 100;
  static const double kDetailsScreenMainPaddingHorizontal = 30;
  static const double kDetailsScreenSpacingBTWItemsVertical = 65;

  /// Profile Screen Related
  /// TODO: HERE
  static const double kProfileCardPaddingVertical = 25;
  static const double kProfileCardPaddingHorizontal = 30;
  static const double kProfileCardSpacingBTWItemsVertical = 20;
  static const double kPaddingProfileCardTextsHorizontal = 30;
  static const double kPaddingProfileCardTextsBetween = 10;
  static const double kPaddingProfileCardFontHeightPrimary = 60;
  static const double kPaddingProfileCardFontHeightSecondary = 35;
  static const double kPaddingProfileCardFontHeightTertiary = 35;

  /// Font Heights
  /// TODO: HERE?
  static const double kPaddingCardFontHeightPrimary = 46;
  static const double kPaddingCardFontHeightSecondary = 37;
  static const double kPaddingCardFontHeightTertiary = 35;

  /// GLOBAL BORDER RADIUSSES
  static const double kRadiusButtonMain = 100;
  static const double kRadiusDialogPopups = 50;
  static const double kRadiusSliderCards = 30;
  static const double kRadiusCreditCards = 35;
  static const double kRadiusCardPrimary = 25;
  static const double kRadiusCardSecondary = 15;

  /// RAW FIGMA DESIGN SIZE
  static const double kRawFigmaDesignWidth = 1179;
  static const double kRawFigmaDesignHeight = 2556;
}
