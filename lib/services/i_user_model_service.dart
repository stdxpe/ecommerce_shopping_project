import 'package:ecommerce_shopping_project/models/new/user_model.dart';

abstract class IUserModelService {
  Future<UserModel> getUserModel({required String uid});
  Future<UserModel> createUserModel({required UserModel userModel});
  Future<UserModel> updateUserModel({required UserModel userModel});
  Future<void> deleteUserModel({required String uid});
}
