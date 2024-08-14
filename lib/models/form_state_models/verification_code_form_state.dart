import 'package:ecommerce_shopping_project/models/textfield_model.dart';

class VerificationCodeFormState {
  VerificationCodeFormState({required this.code, this.status = false});

  final TextFieldModel code;
  final bool? status;

  VerificationCodeFormState copyWith({
    TextFieldModel? code,
    bool? status,
  }) {
    return VerificationCodeFormState(
      code: code ?? this.code,
      status: status ?? this.status,
    );
  }
}
