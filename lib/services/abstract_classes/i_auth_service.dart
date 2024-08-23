import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthService {
  Future<User?> getCurrentUser();

  Future<void> signOut();

  Future<UserCredential> signInWithGoogle();

  Future<UserCredential> signInWithEmailAndPassword(
      {required String email, required String password});

  Future<UserCredential> createUserWithEmailAndPassword(
      {required String email, required String password});
}
