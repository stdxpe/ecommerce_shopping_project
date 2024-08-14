import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

// // final firebaseFirestoreProvider =
// //     Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

// // final firebaseStorageProvider =
// //     Provider<FirebaseStorage>((ref) => FirebaseStorage.instance);