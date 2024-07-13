part of 'utilities_library_imports.dart';

abstract class AppTextThemes {
  /// [APP WIDE GLOBAL VARIABLE]
  ///

  static TextTheme get textTheme => GoogleFonts.interTextTheme().copyWith(
        bodyLarge: GoogleFonts.interTextTheme().bodyLarge!.copyWith(
            // fontSize: 40,
            // fontWeight: FontWeight.w700,
            // letterSpacing: 0.35,
            ),
      );
}

//  static final TextTheme = GoogleFonts.interTextTheme().copyWith(bodyMedium: );
// textTheme: const TextTheme().copyWith(
//   bodyMedium: TextStyle(
//     color: _lightModeColorPalette.text,
//   ),
// ),
