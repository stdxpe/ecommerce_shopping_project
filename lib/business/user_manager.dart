import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:ecommerce_shopping_project/business/abstract_classes/i_user_repository.dart';
import 'package:ecommerce_shopping_project/models/user_model.dart';
import 'package:ecommerce_shopping_project/services/abstract_classes/i_auth_service.dart';
import 'package:ecommerce_shopping_project/services/abstract_classes/i_user_service.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';

class UserManager extends IUserRepository {
  final _authService = locator<IAuthService>();
  final _userService = locator<IUserService>();

  @override
  Future<UserModel?> getUserModel() async {
    try {
      debugPrint('FirebaseUserManager getUserModel try block exec');

      User? currentUser = await _authService.getCurrentUser();
      UserModel? userModel;

      if (currentUser != null) {
        userModel = await _userService.getUserModel(uid: currentUser.uid);
      }
      return userModel;
    } on Exception catch (_) {
      debugPrint(
          'FirebaseUserManager getUserModel catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      debugPrint(
          'FirebaseUserManager getUserModel catch error block exec, rethrowing');
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    debugPrint(
        'FirebaseUserManager signOut exec. Operations to be done before sign-out');
    return _authService.signOut();
  }

  @override
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      debugPrint(
          'FirebaseUserManager signInWithEmailAndPassword try block exec');

      await _authService.signOut();

      await _authService.signInWithEmailAndPassword(
          email: email, password: password);
    } on Exception catch (_) {
      debugPrint(
          'FirebaseUserManager signInWithEmailAndPassword catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      debugPrint(
          'FirebaseUserManager signInWithEmailAndPassword catch error block exec, rethrowing');
      rethrow;
    }
  }

  @override
  Future<void> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      debugPrint(
          'FirebaseUserManager createUserWithEmailAndPassword try block exec');

      await _authService.signOut();

      UserCredential userCredential = await _authService
          .createUserWithEmailAndPassword(email: email, password: password);

      debugPrint(
          'FirebaseUserManager createUserWithEmailAndPassword UserCredential: $userCredential');

      User? user = await _authService.getCurrentUser();
      debugPrint(
          'FirebaseUserManager createUserWithEmailAndPassword User: $user');

      if (user != null && userCredential.user!.uid == user.uid) {
        debugPrint(
            'FirebaseUserManager createUserWithEmailAndPassword if block exec');

        await _userService.createUserModel(
            userModel: UserModel.createNewDefaultUser(user.uid, user.email!));
      } else {
        debugPrint(
            'FirebaseUserManager createUserWithEmailAndPassword else block exec, throwing exception');
        throw Exception();
      }
    } on Exception catch (_) {
      debugPrint(
          'FirebaseUserManager createUserWithEmailAndPassword catch exception block exec, rethrowing');

      rethrow;
    } on Error catch (_) {
      debugPrint(
          'FirebaseUserManager createUserWithEmailAndPassword catch error block exec, rethrowing');
      rethrow;
    }
  }

  @override
  Future<void> signInWithGoogle() async {
    try {
      debugPrint('FirebaseUserManager signInWithGoogle try block exec');

      await _authService.signOut();

      UserCredential userCredential = await _authService.signInWithGoogle();

      debugPrint(
          'FirebaseUserManager signInWithGoogle UserCredential: $userCredential');

      User? user = await _authService.getCurrentUser();
      debugPrint('FirebaseUserManager signInWithGoogle User: $user');

      if (user != null && userCredential.user!.uid == user.uid) {
        debugPrint('FirebaseUserManager signInWithGoogle if block exec');

        bool isUserDocExist =
            await _userService.checkIfUserDocumentExistsOnDb(uid: user.uid);
        if (isUserDocExist == false) {
          await _userService.createUserModel(
              userModel: UserModel.createNewDefaultUser(user.uid, user.email!));
        }
      } else {
        debugPrint(
            'FirebaseUserManager signInWithGoogle else block exec, throwing error');
        throw Exception();
      }
    } on Exception catch (_) {
      debugPrint(
          'FirebaseUserManager signInWithGoogle Exception catch block exec, rethrowing');

      rethrow;
    } on Error catch (_) {
      debugPrint(
          'FirebaseUserManager signInWithGoogle error catch block exec, rethrowing');
      rethrow;
    }
  }
}
