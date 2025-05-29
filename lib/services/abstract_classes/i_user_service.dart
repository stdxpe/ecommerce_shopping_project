import 'package:ecommerce_shopping_project/models/user_model.dart';

abstract class IUserService {
  Future<UserModel?> getUserModel({required String uid});
  Future<void> createUserModel({required UserModel userModel});
  Future<void> updateUserModel({required UserModel userModel});
  Future<void> deleteUserModel({required String uid});
  Future<bool> checkIfUserDocumentExistsOnDb({required String uid});
}
