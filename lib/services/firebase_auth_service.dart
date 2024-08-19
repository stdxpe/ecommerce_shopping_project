import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';
import 'package:ecommerce_shopping_project/services/abstract_classes/i_auth_service.dart';
import 'package:ecommerce_shopping_project/ui/widgets/exceptions/google_signin_exception.dart';

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
    print('FirebaseAuthService signOut');
    return _firebaseAuthService.signOut();
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    if (googleUser != null) {
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      return _firebaseAuthService.signInWithCredential(credential);
    } else {
      throw ExceptionGoogleSignInAborted('Google Sign In Popup Aborted');
    }
  }
}
