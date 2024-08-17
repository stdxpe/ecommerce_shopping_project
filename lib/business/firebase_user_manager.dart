import 'package:firebase_auth/firebase_auth.dart';

import 'package:ecommerce_shopping_project/business/i_user_repository.dart';
import 'package:ecommerce_shopping_project/models/user_model.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';
import 'package:ecommerce_shopping_project/services/i_auth_service.dart';
import 'package:ecommerce_shopping_project/services/i_user_service.dart';

class FirebaseUserManager extends IUserRepository {
  final _authService = locator<IAuthService>();
  final _userService = locator<IUserService>();

  @override
  Future<UserModel?> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      print(
          'FirebaseUserManager createUserWithEmailAndPassword try block exec');

      UserCredential userCredential = await _authService
          .createUserWithEmailAndPassword(email: email, password: password);
      print('Successfully created new user on Firebase Auth!');

      User? user = await _authService.getCurrentUser();

      if (user != null && userCredential.user!.email == user.email) {
        print('user: ${user.email}');

        /// DB Save methods here
        await _userService.createUserModel(
          userModel: UserModel(
            id: user.uid,
            email: user.email!,
            notificationId: 'notificationId',
            username: user.email!,
            phone: 'phone',
            photo: 'photo',
            birthday: 'birthday',
            wishlist: [],
            shoppingCart: [],
            orders: [],
            addresses: [],
            creditCards: [],
          ),
        );

        return await _userService.getUserModel(uid: user.uid);
      } else {
        print('sth is wrong else block exec');
        return null;
      }
      // return true;
    } on FirebaseAuthException catch (_) {
      print(
          'FirebaseUserManager createUserWithEmailAndPassword catch block exec, rethrowing');

      rethrow;
    } on Exception catch (_) {
      print(
          'FirebaseUserManager createUserWithEmailAndPassword catch block exec, rethrowing');

      rethrow;
    }
  }

  @override
  Future<UserModel?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      print('FirebaseUserManager signInWithEmailAndPassword try block exec');

      UserCredential userCredential = await _authService
          .signInWithEmailAndPassword(email: email, password: password);

      User? user = await _authService.getCurrentUser();

      if (user != null && userCredential.user!.uid == user.uid) {
        print('user: ${user}');
        print('Successfully logged in');

        return await _userService.getUserModel(uid: user.uid);
      } else {
        print('sth is wrong else block exec');
        print('gotta never exec');
        return null;
      }
    } on FirebaseAuthException catch (_) {
      print(
          'FirebaseUserManager signInWithEmailAndPassword catch block exec, rethrowing');

      rethrow;
    } on Exception catch (_) {
      print(
          'FirebaseUserManager signInWithEmailAndPassword exception catch block exec, rethrowing');

      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    print('signing out... Operations to be done before sign-out');
    return await _authService.signOut();
  }
}
