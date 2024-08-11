part of 'utilities_library_imports.dart';

extension BuildContextExtensions on BuildContext {
  /// Usage example: `context.mediaQuery.size.height`
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  DefaultTextStyle get defaultTextStyle => DefaultTextStyle.of(this);

  NavigatorState get navigator => Navigator.of(this);

  FocusScopeNode get focusScope => FocusScope.of(this);

  ScaffoldState get scaffold => Scaffold.of(this);

  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);
}
