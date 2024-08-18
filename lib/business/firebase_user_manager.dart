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
  Future<UserModel> createUserWithEmailAndPassword(
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

      if (user != null && userCredential.user!.email == user.email) {
        print(
            'FirebaseUserManager createUserWithEmailAndPassword if block exec');

        await _userService.createUserModel(
          userModel: UserModel(
            id: user.uid,
            email: user.email!,
            username: user.email!,
            notificationId: 'notificationId',
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

        UserModel userModel = await _userService.getUserModel(uid: user.uid);
        print(
            'FirebaseUserManager createUserWithEmailAndPassword userModelWeGet: ${userModel.toString()}');
        return userModel;
      } else {
        print(
            'FirebaseUserManager createUserWithEmailAndPassword else block exec, throwing error');
        throw Exception();
      }
    } on FirebaseAuthException catch (_) {
      print(
          'FirebaseUserManager createUserWithEmailAndPassword Auth catch block exec, rethrowing');

      rethrow;
    } on Exception catch (_) {
      print(
          'FirebaseUserManager createUserWithEmailAndPassword catch block exec, rethrowing');

      rethrow;
    }
  }

  @override
  Future<UserModel> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      print('FirebaseUserManager signInWithEmailAndPassword try block exec');

      await _authService.signOut();

      UserCredential userCredential = await _authService
          .signInWithEmailAndPassword(email: email, password: password);

      print(
          'FirebaseUserManager signInWithEmailAndPassword UserCredential: $userCredential');

      User? user = await _authService.getCurrentUser();
      print('FirebaseUserManager signInWithEmailAndPassword User: $user');

      if (user != null && userCredential.user!.email == user.email) {
        print('FirebaseUserManager signInWithEmailAndPassword if block exec');

        UserModel userModelWeGet =
            await _userService.getUserModel(uid: user.uid);
        print(
            'FirebaseUserManager signInWithEmailAndPassword userModelWeGet: ${userModelWeGet.toString()}');
        return userModelWeGet;
      } else {
        print(
            'FirebaseUserManager signInWithEmailAndPassword else block exec, throwing error');
        throw Exception();
      }
      // return true;
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
  Future<UserModel> signInWithGoogle() async {
    try {
      print('FirebaseUserManager signInWithGoogle try block exec');

      await _authService.signOut();

      UserCredential? userCredential = await _authService.signInWithGoogle();

      print(
          'FirebaseUserManager signInWithGoogle UserCredential: $userCredential');

      User? user = await _authService.getCurrentUser();
      print('FirebaseUserManager signInWithGoogle User: $user');

      if (user != null && userCredential.user!.email == user.email) {
        print('FirebaseUserManager signInWithGoogle if block exec');

        bool isUserDocExist =
            await _userService.checkIfUserDocumentExistsOnDb(uid: user.uid);
        if (isUserDocExist == false) {
          await _userService.createUserModel(
              userModel: UserModel(
                  id: user.uid,
                  email: user.email!,
                  username: user.email!,
                  notificationId: 'notificationId',
                  phone: 'phone',
                  photo: 'photo',
                  birthday: 'birthday',
                  wishlist: [],
                  shoppingCart: [],
                  orders: [],
                  addresses: [],
                  creditCards: []));
        }

        UserModel userModel = await _userService.getUserModel(uid: user.uid);
        print(
            'FirebaseUserManager signInWithGoogle userModel: ${userModel.toString()}');

        return userModel;
      } else {
        print(
            'FirebaseUserManager signInWithGoogle else block exec, throwing error');
        throw Exception();
      }
    }
    // on FirebaseAuthException catch (_) {
    //   print(
    //       'FirebaseUserManager signInWithGoogle Auth catch block exec, rethrowing');

    //   rethrow;
    // }
    on Exception catch (_) {
      print(
          'FirebaseUserManager signInWithGoogle catch block exec, rethrowing');

      rethrow;
    } on Error catch (_) {
      print(
          'FirebaseUserManager signInWithGoogle error catch block exec, rethrowing');
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    print(
        'FirebaseUserManager signOut.. Operations to be done before sign-out');
    return await _authService.signOut();
  }
}
