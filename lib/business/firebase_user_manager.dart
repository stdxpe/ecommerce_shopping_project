import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:ecommerce_shopping_project/business/i_user_repository.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';
import 'package:ecommerce_shopping_project/services/i_auth_service.dart';

class FirebaseUserManager extends IUserRepository {
  final _authService = locator<IAuthService>();

  @override
  Future<User?> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _authService
          .createUserWithEmailAndPassword(email: email, password: password);
      print('manager try block exec');
      User? user = await _authService.getCurrentUser();
      if (user != null && userCredential.user!.email == user.email) {
        print('user: ${user}');
        print('Successfully created new user on Firebase Auth!');

        /// DB Save methods here
        final _db = locator<FirebaseFirestore>();
        // _db.collection('users').
        int index = user.email!.indexOf('@');
        String trimmedUsername = user.email!.substring(0, index);
        await _db.doc('users/${user.uid}').set(<String, dynamic>{
          'uid': user.uid,
          'username': trimmedUsername,
          'email': user.email,
        });

        /// Returns null if fails,
        var testUserModel = await _db.doc('users/${user.uid}').get();
        print('testUserModel : ${testUserModel.data()}');

        // await _db.doc('users/${user.uid}').update(<String, dynamic>{
        //   'email': '${user.email} +updatedValue',
        // });

        // var testUserModelUpdated = await _db.doc('users/${user.uid}').get();
        // print('testUserModelUpdated : ${testUserModelUpdated.data()}');

        print('New UserModel created on the Firebase DB!');

        return user;
      } else {
        print('user is null, else block exec');
        return null;
      }
      // return true;
    } on FirebaseAuthException catch (_) {
      print('manager catch block exec, rethrowing');

      rethrow;
    } on Exception catch (_) {
      print('manager exception catch block exec, rethrowing');

      rethrow;
    }
  }

  @override
  Future<User?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _authService
          .signInWithEmailAndPassword(email: email, password: password);
      print('manager try block exec');

      User? user = await _authService.getCurrentUser();
      if (user != null && userCredential.user!.uid == user.uid) {
        print('user: ${user}');
        print('Successfully logged in');

        return user;
      } else {
        print('user is null, else block exec');
        print('gotta never exec');
        return null;
      }
    } on FirebaseAuthException catch (_) {
      print('manager catch block exec, rethrowing');

      rethrow;
    } on Exception catch (_) {
      print('manager exception catch block exec, rethrowing');

      rethrow;
    }
  }
}
