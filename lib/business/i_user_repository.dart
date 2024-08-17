import 'package:ecommerce_shopping_project/models/user_model.dart';

abstract class IUserRepository {
  Future<UserModel?> createUserWithEmailAndPassword(
      {required String email, required String password});

  Future<UserModel?> signInWithEmailAndPassword(
      {required String email, required String password});

  Future<void> signOut();
}
