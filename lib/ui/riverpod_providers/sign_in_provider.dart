import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/models/form_state_models/sign_in_form_state.dart';
import 'package:ecommerce_shopping_project/models/textfield_model.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/validator_provider.dart';
import 'package:ecommerce_shopping_project/utilities/k_validators.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

final signInProvider =
    StateNotifierProvider.autoDispose<SignInNotifier, SignInFormState>((ref) {
  return SignInNotifier(ref);
});

class SignInNotifier extends StateNotifier<SignInFormState> {
  final Ref ref;
  SignInNotifier(this.ref)
      : super(SignInFormState(
          email: TextFieldModel(text: null, error: null, isValid: false),
          password: TextFieldModel(text: null, error: null, isValid: false),
          status: false,
        ));

  updateEmailErrorMessage(String errorMessage) {
    state = state.copyWith(email: state.email.copyWith(error: errorMessage));
  }

  updatePasswordErrorMessage(String errorMessage) {
    state =
        state.copyWith(password: state.password.copyWith(error: errorMessage));
  }

  updateEmail(String value) =>
      state = state.copyWith(email: state.email.copyWith(text: value));

  updatePassword(String value) =>
      state = state.copyWith(password: state.password.copyWith(text: value));

  validateEmail() => state = state.copyWith(
      email: ref.watch(validatorProvider.notifier).validateTextfieldModel(
            textfieldModel: state.email,
            textFieldModelText: state.email.text,
            isValidCheckExtension: state.email.text?.isValidEmail(),
            textFieldName: 'Email',
            errorText: AppStrings.textfieldEmailErrorMessage,
          ));

  validatePassword() => state = state.copyWith(
      password: ref.watch(validatorProvider.notifier).validateTextfieldModel(
            textfieldModel: state.password,
            textFieldModelText: state.password.text,
            isValidCheckExtension: state.password.text?.isValidPassword(),
            textFieldName: 'Password',
            errorText: AppStrings.textfieldPasswordErrorMessage,
          ));

  getStatus() {
    validateEmail();
    validatePassword();
    state = state.email.isValid &&
            state.password.isValid &&
            ref.read(checkboxSignInProvider)
        ? state.copyWith(status: true)
        : state.copyWith(status: false);
    return state.status;
  }
}

final checkboxSignInProvider = StateProvider<bool>((ref) {
  return true;
});
