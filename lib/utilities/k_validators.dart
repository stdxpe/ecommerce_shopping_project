extension Validator on String {
  bool isValidEmail() => RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(this);

  bool isValidPassword() =>
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?!.*\W).{8,30}$')
          .hasMatch(this);

  bool isMatchingPasswords(String? other) =>
      (other != null && other == this) ? true : false;

  bool isValidPhoneNumber() => RegExp(r'^[0-9.].{9,11}$').hasMatch(this);

  bool isValidVerificationCode() => RegExp(r'^[0-9.].{3,30}$').hasMatch(this);
}
