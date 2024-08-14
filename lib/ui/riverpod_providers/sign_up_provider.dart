import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/models/form_state_models/sign_up_form_state.dart';
import 'package:ecommerce_shopping_project/models/textfield_model.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/validator_provider.dart';
import 'package:ecommerce_shopping_project/utilities/k_validators.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

final signUpProvider =
    StateNotifierProvider.autoDispose<SignUpNotifier, SignUpFormState>((ref) {
  return SignUpNotifier(ref);
});

class SignUpNotifier extends StateNotifier<SignUpFormState> {
  final Ref ref;
  SignUpNotifier(this.ref)
      : super(SignUpFormState(
          email: TextFieldModel(text: null, error: null, isValid: false),
          password: TextFieldModel(text: null, error: null, isValid: false),
          confirmPassword:
              TextFieldModel(text: null, error: null, isValid: false),
          status: false,
        ));

  updateEmail(String value) =>
      state = state.copyWith(email: state.email.copyWith(text: value));

  updatePassword(String value) =>
      state = state.copyWith(password: state.password.copyWith(text: value));

  updateConfirmPassword(String value) => state = state.copyWith(
      confirmPassword: state.confirmPassword.copyWith(text: value));

  validateEmail() => state = state.copyWith(
      email: ref.watch(validatorProvider.notifier).validateTextfieldModel(
          textFieldName: 'Email',
          textfieldModel: state.email,
          textFieldModelText: state.email.text,
          isValidCheckExtension: state.email.text?.isValidEmail(),
          errorText: AppStrings.textfieldEmailErrorMessage));

  validatePassword() => state = state.copyWith(
      password: ref.watch(validatorProvider.notifier).validateTextfieldModel(
            textFieldName: 'Password',
            textfieldModel: state.password,
            textFieldModelText: state.password.text,
            isValidCheckExtension: state.password.text?.isValidPassword(),
            errorText: AppStrings.textfieldPasswordErrorMessage,
          ));

  validateConfirmPassword() => state = state.copyWith(
      confirmPassword:
          ref.watch(validatorProvider.notifier).validateTextfieldModel(
                textFieldName: 'Password',
                textfieldModel: state.confirmPassword,
                textFieldModelText: state.confirmPassword.text,
                isValidCheckExtension: state.confirmPassword.text
                    ?.isPasswordsMatch(state.password.text!),
                errorText: AppStrings.textfieldConfirmPasswordErrorMessage,
              ));

  getStatus() {
    validateEmail();
    validatePassword();
    validateConfirmPassword();
    state = (state.email.isValid &&
            state.password.isValid &&
            state.confirmPassword.isValid)
        ? state.copyWith(status: true)
        : state.copyWith(status: false);
    return state.status;
  }
}
