part of 'utilities_library_imports.dart';

abstract class AppTextThemes {
  /// [APP WIDE GLOBAL VARIABLE]

  static TextTheme get textTheme => const TextTheme().copyWith(
        /// HL: App Title
        headlineLarge: const TextStyle(
          fontSize: 190,
          fontWeight: FontWeight.w800,
          letterSpacing: 12,
          height: 1,
        ),

        /// HM: Login/SignUp Title
        headlineMedium: TextStyle(
          fontSize: 86.sp,
          fontWeight: FontWeight.w700,
          letterSpacing: 0,
        ),

        /// HS: Title Onboarding
        /// HS: App Subtitle (40.sp / w700)
        headlineSmall: const TextStyle(
          fontSize: 66,
          fontWeight: FontWeight.w700,
          letterSpacing: 0,
          height: 1,
        ),

        /// TL: Main Title
        titleLarge: const TextStyle(
          fontSize: 66,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.5,
          height: 1,
        ),

        /// TM: Main Title Text Button
        /// TM: Already have account (w500, w700)
        titleMedium: const TextStyle(
          fontSize: 39,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
          height: 1,
        ),

        /// TS: items found/steps
        titleSmall: const TextStyle(
          fontSize: 39,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.25,
          height: 1,
        ),

        /// LL: Button texts
        labelLarge: const TextStyle(
          fontSize: 45,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
          height: 1.1,
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
          // fontSize: 66,
          fontSize: Constants.kPaddingCardFontHeightPrimary.h,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.5,
          height: 1.2,
        ),

        /// BM: Card Secondary
        bodyMedium: TextStyle(
          // fontSize: 37.sp,
          fontSize: Constants.kPaddingCardFontHeightSecondary.h,
          fontWeight: FontWeight.w700,
          // letterSpacing: -2,
          letterSpacing: 0,
          height: 1,
        ),

        /// BS: Card Tertiary
        bodySmall: TextStyle(
          // fontSize: 35.sp
          fontSize: Constants.kPaddingCardFontHeightTertiary.h,
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
          height: 1,
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
