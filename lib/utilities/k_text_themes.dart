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
        headlineMedium: const TextStyle(
          fontSize: 86,
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
          fontSize: 42,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
          height: 1.1,
        ),

        /// LM: Textfields
        labelMedium: const TextStyle(
          fontSize: 43,
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
        ),

        /// LS: Checkboxes
        labelSmall: const TextStyle(
          fontSize: 39,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
        ),

        /// BL: Card Primary
        bodyLarge: const TextStyle(
          fontSize: 46,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.5,
          height: 1.2,
        ),

        /// BM: Card Secondary
        bodyMedium: const TextStyle(
          fontSize: 37,
          fontWeight: FontWeight.w700,
          letterSpacing: 0,
          height: 1,
        ),

        /// BS: Card Tertiary
        bodySmall: const TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
          height: 1,
        ),

        /// DL: Details Title / Price (60.sp)
        displayLarge: const TextStyle(
          fontSize: 68,
          fontWeight: FontWeight.w700,
          letterSpacing: 0,
        ),

        /// DM: Details Text
        displayMedium: const TextStyle(
          fontSize: 39,
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
        ),

        /// DS: Sheet Texts / Dialog Popups (45/w600)
        displaySmall: const TextStyle(
          fontSize: 40,
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
