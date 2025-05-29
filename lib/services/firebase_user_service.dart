import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:ecommerce_shopping_project/models/user_model.dart';
import 'package:ecommerce_shopping_project/services/abstract_classes/i_user_service.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';

class FirebaseUserService extends IUserService {
  final _db = locator<FirebaseFirestore>();

  @override
  Future<UserModel?> getUserModel({required String uid}) async {
    var returnedDocSnapshot = await _db.doc('users/$uid').get();
    var returnedMap = returnedDocSnapshot.data();

    UserModel? userModel;

    if (returnedDocSnapshot.exists && returnedMap != null) {
      userModel = UserModel.fromMap(returnedMap);
      print(
          'FirebaseUserService getUserModel if block exec. UserModel is not null');
    }
    return userModel;
  }

  @override
  Future<void> createUserModel({required UserModel userModel}) async {
    print('FirebaseUserService createUserModel exec');
    _db.doc('users/${userModel.id}').set(userModel.toMap());
  }

  @override
  Future<void> updateUserModel({required UserModel userModel}) async {
    print('FirebaseUserService updateUserModel exec');
    _db.doc('users/${userModel.id}').update(userModel.toMap());
  }

  @override
  Future<void> deleteUserModel({required String uid}) async {
    print('FirebaseUserService deleteUserModel exec');
    _db.doc('users/$uid').delete();
  }

  @override
  Future<bool> checkIfUserDocumentExistsOnDb({required String uid}) async {
    print('FirebaseUserService checkIfUserDocumentExistsOnDb exec');
    var returnedDocSnapshot = await _db.doc('users/$uid').get();
    return returnedDocSnapshot.exists;
  }
}
