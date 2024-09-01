import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:ecommerce_shopping_project/services/abstract_classes/i_auth_service.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';
import 'package:ecommerce_shopping_project/ui/widgets/exceptions/google_signin_exception.dart';

class FirebaseAuthService extends IAuthService {
  final _authService = locator<FirebaseAuth>();

  @override
  Future<User?> getCurrentUser() async {
    return _authService.currentUser;
  }

  @override
  Future<void> signOut() {
    return _authService.signOut();
  }

  @override
  Future<UserCredential> signInWithEmailAndPassword(
      {required String email, required String password}) {
    return _authService.signInWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<UserCredential> createUserWithEmailAndPassword(
      {required String email, required String password}) {
    return _authService.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    if (googleUser != null) {
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      return _authService.signInWithCredential(credential);
    } else {
      throw ExceptionGoogleSignInAborted('Google Sign In Popup Aborted');
    }
  }
}
