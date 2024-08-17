import 'package:firebase_auth/firebase_auth.dart';

import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';
import 'package:ecommerce_shopping_project/services/i_auth_service.dart';

class FirebaseAuthService extends IAuthService {
  final _firebaseAuthService = locator<FirebaseAuth>();

  @override
  Future<UserCredential> createUserWithEmailAndPassword(
      {required String email, required String password}) {
    return _firebaseAuthService.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<UserCredential> signInWithEmailAndPassword(
      {required String email, required String password}) {
    return _firebaseAuthService.signInWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<User?> getCurrentUser() async {
    return _firebaseAuthService.currentUser;
  }

  @override
  Future<void> signOut() {
    return _firebaseAuthService.signOut();
  }
}
