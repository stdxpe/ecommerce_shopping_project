import 'package:ecommerce_shopping_project/models/textfield_model.dart';

class ForgotPasswordFormState {
  ForgotPasswordFormState({required this.phone, this.status = false});

  final TextFieldModel phone;
  final bool? status;

  ForgotPasswordFormState copyWith({
    TextFieldModel? phone,
    bool? status,
  }) {
    return ForgotPasswordFormState(
      phone: phone ?? this.phone,
      status: status ?? this.status,
    );
  }
}
