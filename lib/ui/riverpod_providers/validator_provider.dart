import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/models/textfield_model.dart';

final validatorProvider =
    StateNotifierProvider<ValidatorNotifier, TextFieldModel>((ref) {
  return ValidatorNotifier(ref);
});

class ValidatorNotifier extends StateNotifier<TextFieldModel> {
  ValidatorNotifier(StateNotifierProviderRef ref)
      : super(TextFieldModel(isValid: false));

  TextFieldModel validateTextfieldModel(TextFieldModel model, String? text,
      bool? isValidCheckExtension, String fieldName,
      {String? optionalErrorText}) {
    if (model.text == null || model.text!.isEmpty) {
      return TextFieldModel(
          isValid: false, text: text, error: '$fieldName cant be empty');
    } else if (model.text != null &&
        model.text!.isNotEmpty &&
        isValidCheckExtension!) {
      return TextFieldModel(isValid: true, text: text, error: null);
    } else {
      return TextFieldModel(
          isValid: false,
          text: text,
          error:

              /// TODO: optionalErrorText
              'Enter a valid ${fieldName.toLowerCase()}\n$optionalErrorText');
    }
  }
}
