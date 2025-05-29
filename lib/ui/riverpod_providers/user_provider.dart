import 'dart:async';

import 'package:ecommerce_shopping_project/services/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/business/abstract_classes/i_user_repository.dart';
import 'package:ecommerce_shopping_project/models/user_model.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';
import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/sign_in_provider.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/sign_up_provider.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

final userProvider =
    AsyncNotifierProvider<UserNotifier, UserModel?>(() => UserNotifier());

class UserNotifier extends AsyncNotifier<UserModel?> {
  @override
  FutureOr<UserModel?> build() async {
    /// Initial State Setting Operation
    print('UserNotifier | BUILD() Executed');
    getUserModel();

    /// Waiting for above method to be completed
    return await future;
  }

  final _userManager = locator<IUserRepository>();

  getUserModel() async {
    print('UserNotifier | getUserModel() Executed');
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      /// Getting the Current Logged-in User's Id from Auth Service
      /// and Fetching the User's Data from DB
      UserModel? userModel = await _userManager.getUserModel();

      /// Setting the State of this Provider into Fetched User's Data
      /// In case it is null, go_router will redirect
      return userModel;
    });
  }

  updateUserDetailsOnSurface({
    String? username,
    String? phoneNumber,
    String? birthday,
    String? profilePhoto,
  }) async {
    print('UserNotifier | updateUserModelOnSurface() Executed');
    var previousState = await future;
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      if (previousState != null) {
        UserModel? tempUserModel = previousState.copyWith(
          username: username ?? previousState.username,
          phone: phoneNumber ?? previousState.phone,
          birthday: birthday ?? previousState.birthday,
          photo: profilePhoto ?? previousState.photo,
        );

        return tempUserModel;
      } else {
        return null;
      }
    });
  }

  signOut() async {
    print('UserNotifier | signOut() Executed');
    await _userManager.signOut();
    state = const AsyncData(null);
  }

  createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    print('UserNotifier | createUserWithEmailAndPassword() Executed');
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        print('Guard block exec');

        /// User Created on Firebase Auth Service with given credentials and Logging-In
        await _userManager.createUserWithEmailAndPassword(
            email: email, password: password);

        /// Getting the Current Logged-in User's Id from Firebase Auth Service
        /// and Fetching the User's Data from DB
        UserModel? userModel = await _userManager.getUserModel();

        print('UserNotifier userModel: ${userModel.toString()}');

        /// Setting the State of this Provider into Fetched User's Data
        /// In case it is null, go_router will redirect
        return userModel;
      },
      (error) {
        print('Provider error block exec | ${error.runtimeType} | $error');
        String? errorCode, errorMessage;

        if (error is FirebaseAuthException) {
          errorCode = error.code;
          errorMessage = error.message;
          print('FirebaseAuthException | $errorCode | $errorMessage');
        }

        /// Error Messages will be shown in textfields if FirebaseAuthException Occured
        /// e.g. "User not found" or "Wrong Email or Password"..
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
    print('UserNotifier | signInWithEmailAndPassword() Executed');
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        print('Guard block exec');

        await _userManager.signInWithEmailAndPassword(
            email: email, password: password);

        UserModel? userModel = await _userManager.getUserModel();
        print('UserNotifier userModel: ${userModel.toString()}');
        return userModel;
      },
      (error) {
        print('Provider error block exec | ${error.runtimeType} | $error');
        String? errorCode, errorMessage;

        if (error is FirebaseAuthException) {
          errorCode = error.code;
          errorMessage = error.message;
          print('FirebaseAuthException | $errorCode | $errorMessage');
        }

        ref.read(signInProvider.notifier).updateEmailErrorMessage(
            AppStrings.firebaseErrorWrongEmailOrPassword);

        ref.read(signInProvider.notifier).updatePasswordErrorMessage(
            AppStrings.firebaseErrorWrongEmailOrPassword);

        return error is Exception || error is Error;
      },
    );

    print('state: ${state.toString()}');
  }

  signInWithGoogle(BuildContext context) async {
    print('UserNotifier | signInWithGoogle() Executed');
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        print('Guard block exec');

        await _userManager.signInWithGoogle();
        UserModel? userModel = await _userManager.getUserModel();
        print('FirebaseAuthNotifier userModel: ${userModel.toString()}');
        return userModel;
      },
      (error) {
        print('Provider error block exec | ${error.runtimeType} | $error');

        /// TODO: Test Error Dialog Popup
        if (error is! ExceptionGoogleSignInAborted) {
          print('ExceptionGoogleSignInAborted Dialog Popup');
          context.push(Routes.dialogError);
        }

        return error is Exception || error is Error;
      },
    );

    if (state.value != null) print('state: ${state.value?.toString()}');
  }
}
