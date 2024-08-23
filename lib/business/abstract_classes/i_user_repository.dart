import 'package:ecommerce_shopping_project/models/user_model.dart';

abstract class IUserRepository {
  Future<UserModel?> getUserModel();

  Future<void> signOut();

  Future<void> signInWithGoogle();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });
}
