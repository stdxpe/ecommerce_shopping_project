import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreditCardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    String enteredData = newValue.text;
    StringBuffer buffer = StringBuffer();
    for (int i = 0; i < enteredData.length; i++) {
      buffer.write(enteredData[i]);
      int index = i + 1;
      if (index % 4 == 0 && enteredData.length != index) {
        buffer.write(" "); // Added space after every 4th digit
      }
    }
    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.toString().length),
    );
  }
}

class CreditCardDateFormatter extends TextInputFormatter {
  final String separator = '/';

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var oldS = oldValue.text;
    var newS = newValue.text;
    var endsWithSeparator = false;

    if (newS.length > oldS.length) {
      for (var char in separator.characters) {
        if (newS.substring(0, newS.length - 1).endsWith(char)) {
          endsWithSeparator = true;
        }
      }

      var clean = newS.replaceAll(separator, '');

      var isDigit = int.tryParse(newS.characters.last);
      if (isDigit == null) {
        return oldValue;
      }

      if (clean.length == 2) {
        var month = int.parse(clean.substring(0, 2));
        if (month > 12) {
          return oldValue;
        }
      }

      if (!endsWithSeparator && clean.length > 1 && clean.length % 2 == 1) {
        return newValue.copyWith(
          text: newS.substring(0, newS.length - 1) +
              separator +
              newS.characters.last,
          selection: TextSelection.collapsed(
            offset: newValue.selection.end + separator.length,
          ),
        );
      }
    }

    if (newS.length < oldS.length) {
      for (var char in separator.characters) {
        if (oldS.substring(0, oldS.length - 1).endsWith(char)) {
          endsWithSeparator = true;
        }
      }

      var clean = oldS.substring(0, oldS.length - 1).replaceAll(separator, '');

      if (endsWithSeparator && clean.isNotEmpty && clean.length % 2 == 0) {
        return newValue.copyWith(
          text: newS.substring(0, newS.length - separator.length),
          selection: TextSelection.collapsed(
            offset: newValue.selection.end - separator.length,
          ),
        );
      }
    }
    return newValue;
  }
}

class CreditCardHolderFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return newValue.copyWith(text: newValue.text.toUpperCase());
  }
}
