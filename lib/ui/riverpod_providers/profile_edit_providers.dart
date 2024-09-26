import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/business/abstract_classes/i_profile_repository.dart';
import 'package:ecommerce_shopping_project/models/user_model.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/user_provider.dart';

final updateProfile = Provider<void>((ref) async {
  final profileManager = locator<IProfileRepository>();
  var controllers = ref.watch(profileEditTextControllers);

  await profileManager.updateProfile(
    username: controllers.username.text,
    phoneNumber: controllers.phoneNumber.text,
    birthday: controllers.birthday.text,
    userModel: ref.watch(userProvider).value!,
  );

  ref.read(userProvider.notifier).updateUserModelOnSurface(
        username: controllers.username.text,
        phoneNumber: controllers.phoneNumber.text,
        birthday: controllers.birthday.text,
      );

  ref.invalidateSelf();
});

/// CREDITCARD TEXTFORMFIELD CONTROLLERS
typedef ProfileEditTextControllerOutputs = ({
  TextEditingController username,
  TextEditingController email,
  TextEditingController phoneNumber,
  TextEditingController birthday,
});
final profileEditTextControllers =
    StateProvider<ProfileEditTextControllerOutputs>((ref) {
  final UserModel? userModel = ref.watch(userProvider).value;

  final TextEditingController controllerUsername =
      TextEditingController(text: userModel?.username);
  final TextEditingController controllerEmail =
      TextEditingController(text: userModel?.email);
  final TextEditingController controllerPhoneNumber =
      TextEditingController(text: userModel?.phone);
  final TextEditingController controllerBirthday =
      TextEditingController(text: userModel?.birthday);

  return (
    username: controllerUsername,
    email: controllerEmail,
    phoneNumber: controllerPhoneNumber,
    birthday: controllerBirthday,
  );
});
