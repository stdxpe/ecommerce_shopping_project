part of 'utilities_library_imports.dart';

abstract class AppThemes {
  /// [APP WIDE GLOBAL VARIABLE]
  /// ALL THEME SETTINGS

  /// [LIGHT THEME]
  static final light = ThemeData(fontFamily: 'Inter').copyWith(
    brightness: Brightness.light,
    scaffoldBackgroundColor: _lightModeColorPalette.scaffoldBackground,
    appBarTheme: const AppBarTheme().copyWith(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: _lightModeColorPalette.appBarBackground,
      foregroundColor: _lightModeColorPalette.appBarForeground,
    ),

    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.fuchsia: CupertinoPageTransitionsBuilder(),
      },
    ),

    // inputDecorationTheme:
    // bottomSheetTheme:
    // snackBarTheme:
    // Usage example: 'Card(
    // shape: Theme.of(context).cardTheme.shape,'
    // cardTheme: CardTheme(
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(4.0),
    //     ),
    //   ),
    textTheme: AppTextThemes.textTheme,
    primaryTextTheme: AppTextThemes.textTheme,

    extensions: [
      _lightModeColorPalette,
    ],
  );
  // theme: ThemeData.light().copyWith(
  //   // useMaterial3: true,
  //   // appBarTheme: kAppBarTheme,
  //   // scaffoldBackgroundColor: ColorPalette.scaffoldBackground,
  //   // scaffoldBackgroundColor: Theme.of(context).colorScheme.surface,
  //   colorScheme: ColorScheme(
  //     brightness: Brightness.light,
  //     primary: ColorPalette.buttonMainBackgroundPrimary,
  //     onPrimary: ColorPalette.buttonMainForegroundPrimary,
  //     secondary: ColorPalette.buttonMainBackgroundSecondary,
  //     onSecondary: ColorPalette.buttonMainForegroundSecondary,
  //     error: Colors.red,
  //     onError: Colors.white,
  //     surface: Colors.red,
  //     onSurface: Colors.blue,
  //     shadow: ColorPalette.shadowColor,
  //     onBackground: Colors.red,
  //   ),

  /// [DARK THEME]
  static final dark = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: _darkModeColorPalette.scaffoldBackground,
    appBarTheme: const AppBarTheme().copyWith(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      backgroundColor: _darkModeColorPalette.appBarBackground,
      foregroundColor: _darkModeColorPalette.appBarForeground,
    ),
    textTheme: AppTextThemes.textTheme,
    primaryTextTheme: AppTextThemes.textTheme,
    extensions: [
      _darkModeColorPalette,
    ],
  );
  // darkTheme: ThemeData.dark().copyWith(
  //   colorScheme: ColorScheme(
  //     brightness: Brightness.dark,
  //     primary: ColorPalette.buttonMainBackgroundPrimary,
  //     onPrimary: ColorPalette.buttonMainForegroundPrimary,
  //     secondary: ColorPalette.buttonMainBackgroundSecondary,
  //     onSecondary: ColorPalette.buttonMainForegroundSecondary,
  //     error: Colors.red,
  //     onError: Colors.white,
  //     surface: Colors.red,
  //     onSurface: Colors.blue,
  //     shadow: ColorPalette.shadowColor,
  //   ),
  // ),

  /// [LIGHT THEME and COLOR PALETTE MAPPING]
  static final _lightModeColorPalette = AppColorsExtension(
    scaffoldBackground: ColorPalette.scaffoldBackground,
    appBarBackground: ColorPalette.appBarBackground,
    appBarForeground: ColorPalette.appBarForeground,
    shadowPrimary: ColorPalette.shadowPrimary,
    shadowSecondary: ColorPalette.shadowSecondary,
    buttonMainBackgroundPrimary: ColorPalette.buttonMainBackgroundPrimary,
    buttonMainForegroundPrimary: ColorPalette.buttonMainForegroundPrimary,
    buttonMainBackgroundSecondary: ColorPalette.buttonMainBackgroundSecondary,
    buttonMainForegroundSecondary: ColorPalette.buttonMainForegroundSecondary,
    title: ColorPalette.title,
    titleFaded: ColorPalette.titleFaded,
    text: ColorPalette.text,
    textFaded: ColorPalette.textFaded,
    textButtonFaded: ColorPalette.textButtonFaded,
    textfield: ColorPalette.textfield,
    cardBackground: ColorPalette.cardBackground,
    cardTextPrimary: ColorPalette.cardTextPrimary,
    cardTextSecondary: ColorPalette.cardTextSecondary,
    cardTextTertiary: ColorPalette.cardTextTertiary,
    sheetBackground: ColorPalette.sheetBackground,
    paymentStatusActive: ColorPalette.paymentStatusActive,
    paymentStatusPassive: ColorPalette.paymentStatusPassive,
    navigationBarBackground: ColorPalette.navigationBarBackground,
    navigationBarActive: ColorPalette.navigationBarActive,
    navigationBarPassive: ColorPalette.navigationBarPassive,
    permaBlackColor: ColorPalette.permaBlackColor,
    permaWhiteColor: ColorPalette.permaWhiteColor,
  );

  /// [DARK THEME and COLOR PALETTE MAPPING]
  static final _darkModeColorPalette = AppColorsExtension(
    scaffoldBackground: ColorPalette.darkModeScaffoldBackground,
    appBarBackground: ColorPalette.darkModeAppBarBackground,
    appBarForeground: ColorPalette.darkModeAppBarForeground,
    shadowPrimary: ColorPalette.darkModeShadowPrimary,
    shadowSecondary: ColorPalette.darkModeShadowSecondary,
    buttonMainBackgroundPrimary:
        ColorPalette.darkModeButtonMainBackgroundPrimary,
    buttonMainForegroundPrimary:
        ColorPalette.darkModeButtonMainForegroundPrimary,
    buttonMainBackgroundSecondary:
        ColorPalette.darkModeButtonMainBackgroundSecondary,
    buttonMainForegroundSecondary:
        ColorPalette.darkModeButtonMainForegroundSecondary,
    title: ColorPalette.darkModeTitle,
    titleFaded: ColorPalette.darkModeTitleFaded,
    text: ColorPalette.darkModeText,
    textFaded: ColorPalette.darkModeTextFaded,
    textButtonFaded: ColorPalette.darkModeTextButtonFaded,
    textfield: ColorPalette.darkModeTextfield,
    cardBackground: ColorPalette.darkModeCardBackground,
    cardTextPrimary: ColorPalette.darkModeCardTextPrimary,
    cardTextSecondary: ColorPalette.darkModeCardTextSecondary,
    cardTextTertiary: ColorPalette.darkModeCardTextTertiary,
    sheetBackground: ColorPalette.darkModeSheetBackground,
    paymentStatusActive: ColorPalette.darkModePaymentStatusActive,
    paymentStatusPassive: ColorPalette.darkModePaymentStatusPassive,
    navigationBarBackground: ColorPalette.darkModeNavigationBarBackground,
    navigationBarActive: ColorPalette.darkModeNavigationBarActive,
    navigationBarPassive: ColorPalette.darkModeNavigationBarPassive,
    permaBlackColor: ColorPalette.darkModePermaBlackColor,
    permaWhiteColor: ColorPalette.darkModePermaWhiteColor,
  );
}

/// [EASY ACCESS to COLOR PALETTE in UI]
/// Usage example: Theme.of(context).colorPalette;
extension AppThemeExtension on ThemeData {
  AppColorsExtension get colorPalette =>
      extension<AppColorsExtension>() ?? AppThemes._lightModeColorPalette;
}

/// [EASY ACCESS to COLOR PALETTE in UI]
/// Usage example: `context.colorPalette` instead of `Theme.of(context).colorPalette`
extension ColorPaletteGetterExtension on BuildContext {
  AppColorsExtension get colorPalette => Theme.of(this).colorPalette;
}

/// [EASY ACCESS to THEME DATA in UI]
/// Usage example: `context.theme` instead of `Theme.of(context)`
/// Final usage will look like this: context.theme.colorPalette.
extension ThemeGetterExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
}

/// [EASY ACCESS to TEXT THEMES in UI]
/// Usage example: `context.textTheme` instead of `Theme.of(context).textTheme`
extension TextThemeGetterExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}
