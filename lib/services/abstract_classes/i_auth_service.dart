import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthService {
  Future<UserCredential> createUserWithEmailAndPassword(
      {required String email, required String password});

  Future<UserCredential> signInWithEmailAndPassword(
      {required String email, required String password});

  Future<UserCredential> signInWithGoogle();

  Future<User?> getCurrentUser();

  Future<void> signOut();
}
