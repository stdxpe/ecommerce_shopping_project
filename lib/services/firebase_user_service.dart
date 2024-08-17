import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_shopping_project/models/user_model.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';
import 'package:ecommerce_shopping_project/services/i_user_service.dart';

class FirebaseUserService extends IUserService {
  final _db = locator<FirebaseFirestore>();

  @override
  Future<UserModel?> getUserModel({required String uid}) async {
    var returnedSnapshot = await _db.doc('users/$uid').get();
    var returnedMap = returnedSnapshot.data();

    UserModel? userModel;
    if (returnedMap != null) {
      userModel = UserModel.fromMap(returnedMap);
      print('New UserModel created on the Firebase DB!');
    }
    return userModel;
  }

  @override
  Future<void> createUserModel({required UserModel userModel}) async {
    _db.doc('users/${userModel.id}').set(userModel.toMap());
  }

  @override
  Future<void> updateUserModel({required UserModel userModel}) async {
    _db.doc('users/${userModel.id}').update(userModel.toMap());
  }

  @override
  Future<void> deleteUserModel({required String uid}) async {
    _db.doc('users/$uid').delete();
  }
}
