import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/validator_provider.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/form_states/sign_in_form_state.dart';
import 'package:ecommerce_shopping_project/models/textfield_model.dart';
import 'package:ecommerce_shopping_project/utilities/k_validators.dart';

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

  updateEmail(String value) =>
      state = state.copyWith(email: state.email.copyWith(text: value));

  updatePassword(String value) =>
      state = state.copyWith(password: state.password.copyWith(text: value));

  validateEmail() => state = state.copyWith(
      email: ref.watch(validatorProvider.notifier).validateTextfieldModel(
          state.email,
          state.email.text,
          state.email.text?.isValidEmail(),
          'Email'));
  // validateTextfieldModel(state.email, state.email.text,
  //     state.email.text?.isValidEmail(), 'Email'));

  validatePassword() => state = state.copyWith(
      password: ref.watch(validatorProvider.notifier).validateTextfieldModel(
          state.password,
          state.password.text,
          // TODO: optionalErrorText: 'Your password must contain 8 characters',
          state.password.text?.isValidPassword(),
          'Password'));

  getStatus() {
    validateEmail();
    validatePassword();
    state = state.email.isValid && state.password.isValid
        ? state.copyWith(status: true)
        : state.copyWith(status: false);
    return state.status;
  }
}
