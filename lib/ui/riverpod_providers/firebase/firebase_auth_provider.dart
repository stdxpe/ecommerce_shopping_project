import 'dart:async';

import 'package:ecommerce_shopping_project/business/i_user_repository.dart';
import 'package:ecommerce_shopping_project/models/new/user_model.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';
import 'package:ecommerce_shopping_project/services/i_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseAuthProvider =
    AsyncNotifierProvider<FirebaseAuthNotifier, User?>(() {
  return FirebaseAuthNotifier();
});

class FirebaseAuthNotifier extends AsyncNotifier<User?> {
  @override
  FutureOr<User?> build() async {
    /// Initial State Setting Operation
    // getCurrentUser();

    /// Waiting for the inner method to be completed
    // return await future;
    return Future.value(null);
    // return null;
  }

  final _userManager = locator<IUserRepository>();
  final _authService = locator<IAuthService>();

  // getCurrentUser() async {
  //   print('FirebaseAuthNotifier | getCurrentUser() Executed');

  //   state = const AsyncLoading();
  //   var allProducts = await AsyncValue.guard(_userManager.);
  //   state = allProducts;
  //   return allProducts;
  // }

  createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    print('FirebaseAuthNotifier | createUserWithEmailAndPassword() Executed');

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        print('guard block exec');

        User? user = await _userManager.createUserWithEmailAndPassword(
            email: email, password: password);
        print('user: $user');

        return user;
      },
      (error) {
        print('provider error block exec');

        print('provider runtimeType: ${error.runtimeType}');

        print('provider error: $error');
        if (error is FirebaseAuthException) print(error.code);
        if (error is FirebaseAuthException) print(error.message);

        // return error is FirebaseAuthException;
        return error is Exception;

        // return error;
        // return (error is FirebaseAuthException) ? error : error is Exception;
      },
    );

    print('state: $state');
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

        User? user = await _userManager.signInWithEmailAndPassword(
            email: email, password: password);
        print('user: $user');

        return user;
      },
      (error) {
        print('provider error block exec');

        print('provider runtimeType: ${error.runtimeType}');

        print('provider error: $error');
        if (error is FirebaseAuthException) print(error.code);
        if (error is FirebaseAuthException) print(error.message);

        // return error is FirebaseAuthException;
        return error is Exception;

        // return error;
        // return (error is FirebaseAuthException) ? error : error is Exception;
      },
    );
    print('state: $state');
  }
}
