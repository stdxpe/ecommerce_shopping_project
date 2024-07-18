part of 'utilities_library_imports.dart';

abstract class AppTextThemes {
  /// [APP WIDE GLOBAL VARIABLE]

  static TextTheme get textTheme => const TextTheme().copyWith(
        /// HL: App Title
        headlineLarge: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 190.sp,
          letterSpacing: 12,
        ),

        /// HM: Login/SignUp Title
        headlineMedium: TextStyle(
          fontSize: 86.sp,
          fontWeight: FontWeight.w700,
          letterSpacing: 0,
        ),

        /// HS: Title Onboarding
        /// HS: App Subtitle (40.sp / w700)
        headlineSmall: TextStyle(
          fontSize: 66.sp,
          fontWeight: FontWeight.w700,
          letterSpacing: 0,
        ),

        /// TL: Main Title
        titleLarge: TextStyle(
          fontSize: 66.sp,
          fontWeight: FontWeight.w700,
          letterSpacing: 0,
        ),

        /// TM: Main Title Text Button
        /// TM: Already have account (w500, w700)
        titleMedium: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 40.sp,
          letterSpacing: 0,
        ),

        /// TS: items found/steps
        titleSmall: TextStyle(
          fontSize: 39.sp,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
        ),

        /// LL: Button texts
        labelLarge: TextStyle(
          fontSize: 45.sp,
          fontWeight: FontWeight.w700,
          letterSpacing: 0,
        ),

        /// LM: Textfields
        labelMedium: TextStyle(
          fontSize: 47.sp,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
        ),

        /// LS: Checkboxes
        labelSmall: TextStyle(
          fontSize: 35.sp,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
        ),

        /// BL: Card Primary
        bodyLarge: TextStyle(
          // fontSize: 46.sp,
          fontSize: Constants.kPaddingCardFontHeightPrimary.sp,
          fontWeight: FontWeight.w700,
          // letterSpacing: -2,
          letterSpacing: -0.5,
          height: 1.2,
        ),

        /// BM: Card Secondary
        bodyMedium: TextStyle(
          // fontSize: 37.sp,
          fontSize: Constants.kPaddingCardFontHeightSecondary.sp,
          fontWeight: FontWeight.w700,
          // letterSpacing: -2,
          letterSpacing: 0,
          height: 1,
        ),

        /// BS: Card Tertiary
        bodySmall: TextStyle(
          fontSize: Constants.kPaddingCardFontHeightTertiary.sp,
          // fontSize: 35.sp
          fontWeight: FontWeight.w700,
          letterSpacing: 0,
        ),

        /// DL: Details Title / Price (60.sp)
        displayLarge: TextStyle(
          fontSize: 68.sp,
          fontWeight: FontWeight.w700,
          letterSpacing: 0,
        ),

        /// DM: Details Text
        displayMedium: TextStyle(
          fontSize: 39.sp,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
        ),

        /// DS: Sheet Texts
        displaySmall: TextStyle(
          fontSize: 40.sp,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
        ),
      );
}


/// HL: App Title
/// HM: Login/SignUp Title
/// HS: Title Onboarding
/// HS: App Subtitle

/// TL: Main Title
/// TM: Main Title Text Button
/// TS: items found/steps

/// LL: Button texts
/// LM: Textfields
/// LS: Checkboxes
/// TM: Already have account

/// BL: Card Primary
/// BM: Card Secondary
/// BS: Card Tertiary

/// DL: Details Title / Price
/// DM: Details Text
/// DS: Sheet Texts
