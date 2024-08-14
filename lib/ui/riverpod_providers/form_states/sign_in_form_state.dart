import 'package:ecommerce_shopping_project/models/textfield_model.dart';

class SignInFormState {
  SignInFormState(
      {required this.email, required this.password, this.status = false});

  final TextFieldModel email;
  final TextFieldModel password;
  final bool? status;

  SignInFormState copyWith({
    TextFieldModel? email,
    TextFieldModel? password,
    bool? status,
  }) {
    return SignInFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}
