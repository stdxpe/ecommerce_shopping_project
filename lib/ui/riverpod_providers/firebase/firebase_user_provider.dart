import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/business/i_user_repository.dart';
import 'package:ecommerce_shopping_project/models/user_model.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';
import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/sign_in_provider.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/sign_up_provider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/exceptions/google_signin_exception.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

final userProvider =
    AsyncNotifierProvider<UserNotifier, UserModel?>(() => UserNotifier());

class UserNotifier extends AsyncNotifier<UserModel?> {
  @override
  FutureOr<UserModel?> build() async => Future.value(null);

  final _userManager = locator<IUserRepository>();

  createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    print('FirebaseAuthNotifier | createUserWithEmailAndPassword() Executed');

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        print('guard block exec');

        UserModel userModel = await _userManager.createUserWithEmailAndPassword(
            email: email, password: password);
        print('FirebaseAuthNotifier userModel: ${userModel.toString()}');

        return userModel;
      },
      (error) {
        print('provider error block exec');

        print('provider runtimeType: ${error.runtimeType}');

        print('provider error: $error');

        String? errorCode;
        String? errorMessage;

        if (error is FirebaseAuthException) {
          print(error.code);
          errorCode = error.code;
          print(error.message);
          errorMessage = error.message;
        }

        ref
            .read(signUpProvider.notifier)
            .updateEmailErrorMessage(errorMessage!);

        return error is Exception || error is Error;
      },
    );

    print('state: ${state.value.toString()}');
  }

  signInWithEmailAndPassword(
      {required String email, required String password}) async {
    print('FirebaseAuthNotifier | signInWithEmailAndPassword() Executed');

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        print('guard block exec');

        UserModel userModel = await _userManager.signInWithEmailAndPassword(
            email: email, password: password);
        print('FirebaseAuthNotifier userModel: ${userModel.toString()}');

        return userModel;
      },
      (error) {
        print('provider error block exec');

        print('provider runtimeType: ${error.runtimeType}');

        print('provider error: $error');

        String? errorCode;
        String? errorMessage;

        if (error is FirebaseAuthException) {
          print(error.code);
          errorCode = error.code;
          print(error.message);
          errorMessage = error.message;
        }

        ref.read(signInProvider.notifier).updateEmailErrorMessage(
              // errorMessage!
              AppStrings.firebaseErrorWrongEmailOrPassword,
            );
        ref.read(signInProvider.notifier).updatePasswordErrorMessage(
              // errorMessage!
              AppStrings.firebaseErrorWrongEmailOrPassword,
            );

        return error is Exception || error is Error;
      },
    );

    print('state: ${state.value.toString()}');
  }

  signInWithGoogle(BuildContext context) async {
    print('FirebaseAuthNotifier | signInWithGoogle() Executed');

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        print('guard block exec');

        UserModel userModel = await _userManager.signInWithGoogle();
        print('FirebaseAuthNotifier userModel: ${userModel.toString()}');

        return userModel;
      },
      (error) {
        print('provider error block exec');

        print('provider runtimeType: ${error.runtimeType}');

        print('provider error: $error');

        if (error is FirebaseAuthException) {
          print(error.code);
          print(error.message);
        }

        /// TODO: Test Error Dialog Popup
        if (error is! ExceptionGoogleSignInAborted) {
          context.push(Routes.dialogError);
        }

        return error is Exception || error is Error;
      },
    );

    print('state: ${state.value.toString()}');
  }

  signOut() {
    print('FirebaseAuthNotifier | signOut() Executed');
    _userManager.signOut();
  }
}
