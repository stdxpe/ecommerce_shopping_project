import 'package:firebase_auth/firebase_auth.dart';

import 'package:ecommerce_shopping_project/business/abstract_classes/i_user_repository.dart';
import 'package:ecommerce_shopping_project/models/user_model.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';
import 'package:ecommerce_shopping_project/services/abstract_classes/i_auth_service.dart';
import 'package:ecommerce_shopping_project/services/abstract_classes/i_user_service.dart';

class FirebaseUserManager extends IUserRepository {
  final _authService = locator<IAuthService>();
  final _userService = locator<IUserService>();

  @override
  Future<UserModel?> getUserModel() async {
    try {
      print('FirebaseUserManager getUserModel try block exec');

      User? currentUser = await _authService.getCurrentUser();
      UserModel? userModel;

      if (currentUser != null) {
        userModel = await _userService.getUserModel(uid: currentUser.uid);
      }
      return userModel;
    } on Exception catch (_) {
      print(
          'FirebaseUserManager getUserModel catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      print(
          'FirebaseUserManager getUserModel catch error block exec, rethrowing');
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    print(
        'FirebaseUserManager signOut.. Operations to be done before sign-out');
    return _authService.signOut();
  }

  @override
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      print('FirebaseUserManager signInWithEmailAndPassword try block exec');

      await _authService.signOut();

      await _authService.signInWithEmailAndPassword(
          email: email, password: password);
    } on Exception catch (_) {
      print(
          'FirebaseUserManager signInWithEmailAndPassword catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      print(
          'FirebaseUserManager signInWithEmailAndPassword catch error block exec, rethrowing');
      rethrow;
    }
  }

  @override
  Future<void> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      print(
          'FirebaseUserManager createUserWithEmailAndPassword try block exec');

      await _authService.signOut();

      UserCredential userCredential = await _authService
          .createUserWithEmailAndPassword(email: email, password: password);

      print(
          'FirebaseUserManager createUserWithEmailAndPassword UserCredential: $userCredential');

      User? user = await _authService.getCurrentUser();
      print('FirebaseUserManager createUserWithEmailAndPassword User: $user');

      if (user != null && userCredential.user!.uid == user.uid) {
        print(
            'FirebaseUserManager createUserWithEmailAndPassword if block exec');

        await _userService.createUserModel(
            userModel: UserModel.createNewDefaultUser(user.uid, user.email!));
      } else {
        print(
            'FirebaseUserManager createUserWithEmailAndPassword else block exec, throwing exception');
        throw Exception();
      }
    } on Exception catch (_) {
      print(
          'FirebaseUserManager createUserWithEmailAndPassword catch exception block exec, rethrowing');

      rethrow;
    } on Error catch (_) {
      print(
          'FirebaseUserManager createUserWithEmailAndPassword catch error block exec, rethrowing');
      rethrow;
    }
  }

  @override
  Future<void> signInWithGoogle() async {
    try {
      print('FirebaseUserManager signInWithGoogle try block exec');

      await _authService.signOut();

      UserCredential userCredential = await _authService.signInWithGoogle();

      print(
          'FirebaseUserManager signInWithGoogle UserCredential: $userCredential');

      User? user = await _authService.getCurrentUser();
      print('FirebaseUserManager signInWithGoogle User: $user');

      if (user != null && userCredential.user!.uid == user.uid) {
        print('FirebaseUserManager signInWithGoogle if block exec');

        bool isUserDocExist =
            await _userService.checkIfUserDocumentExistsOnDb(uid: user.uid);
        if (isUserDocExist == false) {
          await _userService.createUserModel(
              userModel: UserModel.createNewDefaultUser(user.uid, user.email!));
        }
      } else {
        print(
            'FirebaseUserManager signInWithGoogle else block exec, throwing error');
        throw Exception();
      }
    } on Exception catch (_) {
      print(
          'FirebaseUserManager signInWithGoogle Exception catch block exec, rethrowing');

      rethrow;
    } on Error catch (_) {
      print(
          'FirebaseUserManager signInWithGoogle error catch block exec, rethrowing');
      rethrow;
    }
  }
}
