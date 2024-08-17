import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/business/i_user_repository.dart';
import 'package:ecommerce_shopping_project/models/user_model.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/sign_in_provider.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/sign_up_provider.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

final userProvider = AsyncNotifierProvider<UserNotifier, UserModel?>(() {
  return UserNotifier();
});

class UserNotifier extends AsyncNotifier<UserModel?> {
  @override
  FutureOr<UserModel?> build() async {
    /// Initial State Setting Operation
    // getCurrentUser();

    /// Waiting for the inner method to be completed
    // return await future;
    return Future.value(null);
    // return null;
  }

  final _userManager = locator<IUserRepository>();

  // getCurrentUser() async {
  //   print('FirebaseAuthNotifier | getCurrentUser() Executed');

  //   state = const AsyncLoading();
  //   var allProducts = await AsyncValue.guard(_userManager.);
  //   state = allProducts;
  //   return allProducts;
  // }

  createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    print('FirebaseAuthNotifier | createUserWithEmailAndPassword() Executed');

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        print('guard block exec');

        UserModel? userModel = await _userManager
            .createUserWithEmailAndPassword(email: email, password: password);
        print('userModel: ${userModel.toString()}');

        if (userModel != null) return userModel;
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
        }
        if (error is FirebaseAuthException) {
          print(error.message);
          errorMessage = error.message;
        }

        ref
            .read(signUpProvider.notifier)
            .updateEmailErrorMessage(errorMessage!);

        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   content: Text(
        //     errorMessage ?? 'Something went wrong',
        //     style: context.textTheme.bodySmall!.copyWith(fontSize: 40.h),
        //   ),
        // ));

        // return error is FirebaseAuthException;
        return error is Exception;

        // return error;
        // return (error is FirebaseAuthException) ? error : error is Exception;
      },
    );

    print('state: ${state.value.toString()}');
    // state = allProducts;
    // return allProducts;
  }

  signInWithEmailAndPassword(
      {required String email, required String password}) async {
    print('FirebaseAuthNotifier | signInWithEmailAndPassword() Executed');

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        print('guard block exec');

        UserModel? userModel = await _userManager.signInWithEmailAndPassword(
            email: email, password: password);
        print('userModel: ${userModel.toString()}');

        return userModel;
      },
      (error) {
        print('provider error block exec');

        print('provider runtimeType: ${error.runtimeType}');

        print('provider error: $error');
        if (error is FirebaseAuthException) print(error.code);
        if (error is FirebaseAuthException) print(error.message);

        String? errorCode;
        String? errorMessage;
        if (error is FirebaseAuthException) {
          print(error.code);
          errorCode = error.code;
        }
        if (error is FirebaseAuthException) {
          print(error.message);
          errorMessage = error.message;
        }

        ref.read(signInProvider.notifier).updatePasswordErrorMessage(
            AppStrings.firebaseErrorWrongEmailOrPassword);

        // return error is FirebaseAuthException;
        return error is Exception;

        // return error;
        // return (error is FirebaseAuthException) ? error : error is Exception;
      },
    );
    print('state: ${state.value.toString()}');
  }

  signOut() {
    print('FirebaseAuthNotifier | signOut() Executed');
    _userManager.signOut();
  }
}
