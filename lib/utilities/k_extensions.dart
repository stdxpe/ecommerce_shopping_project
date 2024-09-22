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

extension DateTimeExtensions on Timestamp {
  /// Usage Example: 'timestampData.formatDate'
  /// Instead of: DateFormat('dd.MM.yyyy').format(timestampData.toDate());

  // ignore: unnecessary_this
  String get formatDate => DateFormat('dd.MM.yyyy').format(this.toDate());
}

extension StringExtension on String {
  String get capitalize {
    // ignore: unnecessary_this, unnecessary_null_comparison
    if (this == null || this.isEmpty) return this;
    return StringUtils.capitalize(this, allWords: true);
  }
}

extension PriceInUSDSignExtension on double {
  String get inUSD {
    // ignore: unnecessary_this
    return '\$${this.toStringAsFixed(2)}';
  }
}

extension IsKeyboardOpen on BuildContext {
  bool get isKeyboardOpen {
    return MediaQuery.of(this).viewInsets.bottom == 0;
  }
}

extension HideCreditCardNumber on String? {
  String get hideCreditCardNumber {
    if (this != null && this!.isNotEmpty && this!.length >= 19) {
      int length = this!.length;
      // ignore: unnecessary_this
      String temp = this!.substring(length - 4, length);
      return '**** **** **** $temp';
      // return RegExp(r'^[0-9.](?=.*.{4})$').stringMatch(this)!;
    } else {
      return '';
    }
  }
}
