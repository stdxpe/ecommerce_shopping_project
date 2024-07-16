part of 'utilities_library_imports.dart';

class AppTextThemes {
  /// [APP WIDE GLOBAL VARIABLE]

  static TextTheme get textTheme => GoogleFonts.interTextTheme().copyWith(
        /// HL: App Title
        headlineLarge: GoogleFonts.inter(
          fontWeight: FontWeight.w800,
          fontSize: 190.sp,
          letterSpacing: 12,
        ),

        /// HM: Login/SignUp Title
        headlineMedium: GoogleFonts.inter(
          fontSize: 86.sp,
          fontWeight: FontWeight.w700,
          letterSpacing: 0,
        ),

        /// HS: Title Onboarding
        /// HS: App Subtitle (40.sp / w700)
        headlineSmall: GoogleFonts.inter(
          fontSize: 66.sp,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
        ),

        /// TL: Main Title
        titleLarge: GoogleFonts.inter(
          fontSize: 66.sp,
          fontWeight: FontWeight.w700,
          letterSpacing: 0,
        ),

        /// TM: Main Title Text Button
        /// TM: Already have account (w500, w700)
        titleMedium: GoogleFonts.inter(
          fontSize: 40.sp,
          fontWeight: FontWeight.w700,
          letterSpacing: 0,
        ),

        /// TS: items found/steps
        titleSmall: GoogleFonts.inter(
          fontSize: 39.sp,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
        ),

        /// LL: Button texts
        labelLarge: GoogleFonts.inter(
          fontSize: 45.sp,
          fontWeight: FontWeight.w700,
          letterSpacing: 0,
        ),

        /// LM: Textfields
        labelMedium: GoogleFonts.inter(
          fontSize: 47.sp,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
        ),

        /// LS: Checkboxes
        labelSmall: GoogleFonts.inter(
          fontSize: 35.sp,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
        ),

        /// BL: Card Primary
        bodyLarge: GoogleFonts.inter(
          fontSize: 47.sp,
          fontWeight: FontWeight.w700,
          letterSpacing: -2,
        ),

        /// BM: Card Secondary
        bodyMedium: GoogleFonts.inter(
          fontSize: 37.sp,
          fontWeight: FontWeight.w700,
          letterSpacing: -2,
        ),

        /// BS: Card Tertiary
        bodySmall: GoogleFonts.inter(
          fontSize: 37.sp,
          fontWeight: FontWeight.w700,
          letterSpacing: -2,
        ),

        /// DL: Details Title / Price (60.sp)
        displayLarge: GoogleFonts.inter(
          fontSize: 68.sp,
          fontWeight: FontWeight.w700,
          letterSpacing: 0,
        ),

        /// DM: Details Text
        displayMedium: GoogleFonts.inter(
          fontSize: 39.sp,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
        ),

        /// DS: Sheet Texts
        displaySmall: GoogleFonts.inter(
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
