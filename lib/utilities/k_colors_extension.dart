part of 'utilities_library_imports.dart';

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  AppColorsExtension({
    required this.scaffoldBackground,
    required this.appBarBackground,
    required this.appBarForeground,
    required this.shadowPrimary,
    required this.shadowSecondary,
    required this.buttonMainBackgroundPrimary,
    required this.buttonMainForegroundPrimary,
    required this.buttonMainBackgroundSecondary,
    required this.buttonMainForegroundSecondary,
    required this.title,
    required this.titleFaded,
    required this.text,
    required this.textFaded,
    required this.textButtonFaded,
    required this.textfield,
    required this.cardBackground,
    required this.cardTextPrimary,
    required this.cardTextSecondary,
    required this.cardTextTertiary,
    required this.sheetBackground,
    required this.paymentStatusActive,
    required this.paymentStatusPassive,
    required this.navigationBarBackground,
    required this.navigationBarActive,
    required this.navigationBarPassive,
    required this.permaBlackColor,
    required this.permaWhiteColor,
  });

  final Color scaffoldBackground;
  final Color appBarBackground;
  final Color appBarForeground;
  final Color shadowPrimary;
  final Color shadowSecondary;
  final Color buttonMainBackgroundPrimary;
  final Color buttonMainForegroundPrimary;
  final Color buttonMainBackgroundSecondary;
  final Color buttonMainForegroundSecondary;
  final Color title;
  final Color titleFaded;
  final Color text;
  final Color textFaded;
  final Color textButtonFaded;
  final Color textfield;
  final Color cardBackground;
  final Color cardTextPrimary;
  final Color cardTextSecondary;
  final Color cardTextTertiary;
  final Color sheetBackground;
  final Color paymentStatusActive;
  final Color paymentStatusPassive;
  final Color navigationBarBackground;
  final Color navigationBarActive;
  final Color navigationBarPassive;
  final Color permaBlackColor;
  final Color permaWhiteColor;

  @override
  ThemeExtension<AppColorsExtension> copyWith({
    Color? scaffoldBackground,
    Color? appBarBackground,
    Color? appBarForeground,
    Color? shadowPrimary,
    Color? shadowSecondary,
    Color? buttonMainBackgroundPrimary,
    Color? buttonMainForegroundPrimary,
    Color? buttonMainBackgroundSecondary,
    Color? buttonMainForegroundSecondary,
    Color? title,
    Color? titleFaded,
    Color? text,
    Color? textFaded,
    Color? textButtonFaded,
    Color? textfield,
    Color? cardBackground,
    Color? cardTextPrimary,
    Color? cardTextSecondary,
    Color? cardTextTertiary,
    Color? sheetBackground,
    Color? paymentStatusActive,
    Color? paymentStatusPassive,
    Color? navigationBarBackground,
    Color? navigationBarActive,
    Color? navigationBarPassive,
    Color? permaBlackColor,
    Color? permaWhiteColor,
  }) {
    return AppColorsExtension(
      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
      appBarBackground: appBarBackground ?? this.appBarBackground,
      appBarForeground: appBarForeground ?? this.appBarForeground,
      shadowPrimary: shadowPrimary ?? this.shadowPrimary,
      shadowSecondary: shadowSecondary ?? this.shadowSecondary,
      buttonMainBackgroundPrimary:
          buttonMainBackgroundPrimary ?? this.buttonMainBackgroundPrimary,
      buttonMainForegroundPrimary:
          buttonMainForegroundPrimary ?? this.buttonMainForegroundPrimary,
      buttonMainBackgroundSecondary:
          buttonMainBackgroundSecondary ?? this.buttonMainBackgroundSecondary,
      buttonMainForegroundSecondary:
          buttonMainForegroundSecondary ?? this.buttonMainForegroundSecondary,
      title: title ?? this.title,
      titleFaded: titleFaded ?? this.titleFaded,
      text: text ?? this.text,
      textFaded: textFaded ?? this.textFaded,
      textButtonFaded: textButtonFaded ?? this.textButtonFaded,
      textfield: textfield ?? this.textfield,
      cardBackground: cardBackground ?? this.cardBackground,
      cardTextPrimary: cardTextPrimary ?? this.cardTextPrimary,
      cardTextSecondary: cardTextSecondary ?? this.cardTextSecondary,
      cardTextTertiary: cardTextTertiary ?? this.cardTextTertiary,
      sheetBackground: sheetBackground ?? this.sheetBackground,
      paymentStatusActive: paymentStatusActive ?? this.paymentStatusActive,
      paymentStatusPassive: paymentStatusPassive ?? this.paymentStatusPassive,
      navigationBarBackground:
          navigationBarBackground ?? this.navigationBarBackground,
      navigationBarActive: navigationBarActive ?? this.navigationBarActive,
      navigationBarPassive: navigationBarPassive ?? this.navigationBarPassive,
      permaBlackColor: permaBlackColor ?? this.permaBlackColor,
      permaWhiteColor: permaWhiteColor ?? this.permaWhiteColor,
    );
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(
    covariant ThemeExtension<AppColorsExtension>? other,
    double t,
  ) {
    if (other is! AppColorsExtension) {
      return this;
    }

    return AppColorsExtension(
      scaffoldBackground:
          Color.lerp(scaffoldBackground, other.scaffoldBackground, t)!,
      appBarBackground:
          Color.lerp(appBarBackground, other.appBarBackground, t)!,
      appBarForeground:
          Color.lerp(appBarForeground, other.appBarForeground, t)!,
      shadowPrimary: Color.lerp(shadowPrimary, other.shadowPrimary, t)!,
      shadowSecondary: Color.lerp(shadowSecondary, other.shadowSecondary, t)!,
      buttonMainBackgroundPrimary: Color.lerp(
          buttonMainBackgroundPrimary, other.buttonMainBackgroundPrimary, t)!,
      buttonMainForegroundPrimary: Color.lerp(
          buttonMainForegroundPrimary, other.buttonMainForegroundPrimary, t)!,
      buttonMainBackgroundSecondary: Color.lerp(buttonMainBackgroundSecondary,
          other.buttonMainBackgroundSecondary, t)!,
      buttonMainForegroundSecondary: Color.lerp(buttonMainForegroundSecondary,
          other.buttonMainForegroundSecondary, t)!,
      title: Color.lerp(title, other.title, t)!,
      titleFaded: Color.lerp(titleFaded, other.titleFaded, t)!,
      text: Color.lerp(text, other.text, t)!,
      textFaded: Color.lerp(textFaded, other.textFaded, t)!,
      textButtonFaded: Color.lerp(textButtonFaded, other.textButtonFaded, t)!,
      textfield: Color.lerp(textfield, other.textfield, t)!,
      cardBackground: Color.lerp(cardBackground, other.cardBackground, t)!,
      cardTextPrimary: Color.lerp(cardTextPrimary, other.cardTextPrimary, t)!,
      cardTextSecondary:
          Color.lerp(cardTextSecondary, other.cardTextSecondary, t)!,
      cardTextTertiary:
          Color.lerp(cardTextTertiary, other.cardTextTertiary, t)!,
      sheetBackground: Color.lerp(sheetBackground, other.sheetBackground, t)!,
      paymentStatusActive:
          Color.lerp(paymentStatusActive, other.paymentStatusActive, t)!,
      paymentStatusPassive:
          Color.lerp(paymentStatusPassive, other.paymentStatusPassive, t)!,
      navigationBarBackground: Color.lerp(
          navigationBarBackground, other.navigationBarBackground, t)!,
      navigationBarActive:
          Color.lerp(navigationBarActive, other.navigationBarActive, t)!,
      navigationBarPassive:
          Color.lerp(navigationBarPassive, other.navigationBarPassive, t)!,
      permaBlackColor: Color.lerp(permaBlackColor, other.permaBlackColor, t)!,
      permaWhiteColor: Color.lerp(permaWhiteColor, other.permaWhiteColor, t)!,
    );
  }
}


// /// Optional. If you also want to assign colors in the `ColorScheme`.
// extension ColorSchemeBuilder on AppColorsExtension {
//   ColorScheme toColorScheme(Brightness brightness) {
//     return ColorScheme(
//       brightness: brightness,
//       primary: primary,
//       onPrimary: onPrimary,
//       secondary: secondary,
//       onSecondary: onSecondary,
//       error: error,
//       onError: onError,
//       background: background,
//       onBackground: onBackground,
//       surface: surface,
//       onSurface: onSurface,
//     );
//   }