import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/models/form_state_models/verification_code_form_state.dart';
import 'package:ecommerce_shopping_project/models/textfield_model.dart';
import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/validator_provider.dart';
import 'package:ecommerce_shopping_project/utilities/k_validators.dart';

final verificationNavigatorProvider =
    Provider.family<void, BuildContext>((ref, context) {
  String? codeText = ref.watch(verificationCodeProvider).code.text;
  if (codeText != null && codeText.length >= 3) {
    ref.watch(verificationCodeProvider.notifier).getStatus();
    print('status: ${ref.watch(verificationCodeProvider).status}');

    if (ref.watch(verificationCodeProvider).status!) {
      /// TODO: Firebase methods here
      context.push(Routes.home);
    }
  }
});

final verificationCodeProvider =
    StateNotifierProvider<VerificationCodeNotifier, VerificationCodeFormState>(
        (ref) {
  return VerificationCodeNotifier(ref);
});

class VerificationCodeNotifier
    extends StateNotifier<VerificationCodeFormState> {
  final Ref ref;
  VerificationCodeNotifier(this.ref)
      : super(VerificationCodeFormState(
          code: TextFieldModel(text: null, error: null, isValid: false),
          status: false,
        ));

  updateCode(String value) =>
      state = state.copyWith(code: state.code.copyWith(text: value));

  validateVerificationCode() => state = state.copyWith(
      code: ref.watch(validatorProvider.notifier).validateTextfieldModel(
            textfieldModel: state.code,
            textFieldModelText: state.code.text,
            isValidCheckExtension: state.code.text?.isValidVerificationCode(),
            textFieldName: 'Code',
            // errorText: AppStrings.textfieldVerificationCodeErrorMessage,
            errorText: '0',
          ));

  getStatus() {
    validateVerificationCode();
    state = state.code.isValid
        ? state.copyWith(status: true)
        : state.copyWith(status: false);
    return state.status;
  }
}
