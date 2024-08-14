import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/models/textfield_model.dart';

final validatorProvider =
    StateNotifierProvider<ValidatorNotifier, TextFieldModel>((ref) {
  return ValidatorNotifier(ref);
});

class ValidatorNotifier extends StateNotifier<TextFieldModel> {
  ValidatorNotifier(StateNotifierProviderRef ref)
      : super(TextFieldModel(isValid: false));

  TextFieldModel validateTextfieldModel(
      {required TextFieldModel textfieldModel,
      required String? textFieldModelText,
      required bool? isValidCheckExtension,
      required String textFieldName,
      required String errorText}) {
    if (textfieldModel.text == null || textfieldModel.text!.isEmpty) {
      return TextFieldModel(
          isValid: false,
          text: textFieldModelText,
          error: '$textFieldName cant be empty');
    } else if (textfieldModel.text != null &&
        textfieldModel.text!.isNotEmpty &&
        isValidCheckExtension!) {
      return TextFieldModel(
          isValid: true, text: textFieldModelText, error: null);
    } else {
      return TextFieldModel(
          isValid: false, text: textFieldModelText, error: errorText);
    }
  }
}
