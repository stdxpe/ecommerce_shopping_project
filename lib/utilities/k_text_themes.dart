part of 'utilities_library_imports.dart';

abstract class AppTextThemes {
  /// [APP WIDE GLOBAL VARIABLE]
  ///

  static TextTheme get textTheme => GoogleFonts.interTextTheme().copyWith(
        /// HL: App Title
        headlineLarge: GoogleFonts.interTextTheme().headlineLarge!.copyWith(
              // fontSize: 190.sp,
              fontWeight: FontWeight.w700,
              letterSpacing: 12,
            ),

        /// HM: Login/SignUp Title
        headlineMedium: GoogleFonts.interTextTheme().headlineMedium!.copyWith(
              // fontSize: 86.sp,
              fontWeight: FontWeight.w700,
              letterSpacing: 0,
            ),

        /// HS: Title Onboarding
        /// HS: App Subtitle (40.sp / w700)
        headlineSmall: GoogleFonts.interTextTheme().headlineSmall!.copyWith(
              // fontSize: 66.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: 0,
            ),

        /// TL: Main Title
        titleLarge: GoogleFonts.interTextTheme().titleLarge!.copyWith(
              // fontSize: 66.sp,
              fontWeight: FontWeight.w700,
              letterSpacing: 0,
            ),

        /// TM: Main Title Text Button
        /// TM: Already have account (w500, w700)
        titleMedium: GoogleFonts.interTextTheme().titleMedium!.copyWith(
              // fontSize: 40.sp,
              fontWeight: FontWeight.w700,
              letterSpacing: 0,
            ),

        /// TS: items found/steps
        titleSmall: GoogleFonts.interTextTheme().titleSmall!.copyWith(
              // fontSize: 39.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: 0,
            ),

        /// LL: Button texts
        labelLarge: GoogleFonts.interTextTheme().labelLarge!.copyWith(
              // fontSize: 45.sp,
              fontWeight: FontWeight.w700,
              letterSpacing: 0,
            ),

        /// LM: Textfields
        labelMedium: GoogleFonts.interTextTheme().labelMedium!.copyWith(
              // fontSize: 47.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: 0,
            ),

        /// LS: Checkboxes
        labelSmall: GoogleFonts.interTextTheme().labelSmall!.copyWith(
              // fontSize: 35.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: 0,
            ),

        /// BL: Card Primary
        bodyLarge: GoogleFonts.interTextTheme().bodyLarge!.copyWith(
              // fontSize: 47.sp,
              fontWeight: FontWeight.w700,
              letterSpacing: -2,
            ),

        /// BM: Card Secondary
        bodyMedium: GoogleFonts.interTextTheme().bodyMedium!.copyWith(
              // fontSize: 37.sp,
              fontWeight: FontWeight.w700,
              letterSpacing: -2,
            ),

        /// BS: Card Tertiary
        bodySmall: GoogleFonts.interTextTheme().bodySmall!.copyWith(
              // fontSize: 37.sp,
              fontWeight: FontWeight.w700,
              letterSpacing: -2,
            ),

        /// DL: Details Title / Price (60.sp)
        displayLarge: GoogleFonts.interTextTheme().displayLarge!.copyWith(
              // fontSize: 68.sp,
              fontWeight: FontWeight.w700,
              letterSpacing: 0,
            ),

        /// DM: Details Text
        displayMedium: GoogleFonts.interTextTheme().displayMedium!.copyWith(
              // fontSize: 39.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: 0,
            ),

        /// DS: Sheet Texts
        displaySmall: GoogleFonts.interTextTheme().displaySmall!.copyWith(
              // fontSize: 40.sp,
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
