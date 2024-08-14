class TextFieldModel {
  final String? text;
  final String? error;
  final bool isValid;

  TextFieldModel({this.text, this.error, this.isValid = false});

  TextFieldModel copyWith({
    String? text,
    String? error,
    bool? isValid,
  }) {
    return TextFieldModel(
      text: text ?? this.text,
      error: error ?? this.error,
      isValid: isValid ?? this.isValid,
    );
  }
}
