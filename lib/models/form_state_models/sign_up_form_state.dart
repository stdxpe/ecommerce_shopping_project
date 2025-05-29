import 'package:ecommerce_shopping_project/models/textfield_model.dart';

class SignUpFormState {
  SignUpFormState({
    required this.email,
    required this.password,
    required this.confirmPassword,
    this.status = false,
  });

  final TextFieldModel email;
  final TextFieldModel password;
  final TextFieldModel confirmPassword;
  final bool? status;

  SignUpFormState copyWith({
    TextFieldModel? email,
    TextFieldModel? password,
    TextFieldModel? confirmPassword,
    bool? status,
  }) {
    return SignUpFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      status: status ?? this.status,
    );
  }
}
