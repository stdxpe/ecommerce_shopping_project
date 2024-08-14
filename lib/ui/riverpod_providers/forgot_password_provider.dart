import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/models/form_state_models/forgot_password_form_state.dart';
import 'package:ecommerce_shopping_project/models/textfield_model.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/validator_provider.dart';
import 'package:ecommerce_shopping_project/utilities/k_validators.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

final forgotPasswordProvider = StateNotifierProvider.autoDispose<
    ForgotPasswordNotifier, ForgotPasswordFormState>((ref) {
  return ForgotPasswordNotifier(ref);
});

class ForgotPasswordNotifier extends StateNotifier<ForgotPasswordFormState> {
  final Ref ref;
  ForgotPasswordNotifier(this.ref)
      : super(ForgotPasswordFormState(
          phone: TextFieldModel(text: null, error: null, isValid: false),
          status: false,
        ));

  updatePhone(String value) =>
      state = state.copyWith(phone: state.phone.copyWith(text: value));

  validatePhoneNumber() => state = state.copyWith(
      phone: ref.watch(validatorProvider.notifier).validateTextfieldModel(
            textfieldModel: state.phone,
            textFieldModelText: state.phone.text,
            isValidCheckExtension: state.phone.text?.isValidPhoneNumber(),
            textFieldName: 'Phone',
            errorText: AppStrings.textfieldPhoneErrorMessage,
          ));

  getStatus() {
    validatePhoneNumber();
    state = state.phone.isValid
        ? state.copyWith(status: true)
        : state.copyWith(status: false);
    return state.status;
  }
}
