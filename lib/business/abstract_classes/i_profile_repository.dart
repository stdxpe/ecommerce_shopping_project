import 'package:ecommerce_shopping_project/models/address.dart';
import 'package:ecommerce_shopping_project/models/credit_card.dart';
import 'package:ecommerce_shopping_project/models/user_model.dart';

abstract class IProfileRepository {
  Future<void> updateProfile({
    required String username,
    required String phoneNumber,
    required String birthday,
    required UserModel userModel,
  });

  Future<String?> updateProfilePhoto({
    required UserModel userModel,
  });

  Future<List<Address>> getAddresses({
    required UserModel userModel,
  });

  Future<void> createAddress({
    required Address address,
    required UserModel userModel,
  });

  Future<void> deleteAddress({
    required Address address,
    required UserModel userModel,
  });

  Future<void> updateAddress({
    required Address address,
    required UserModel userModel,
  });

  Future<List<CreditCard>> getCreditCards({
    required UserModel userModel,
  });

  Future<void> createCreditCard({
    required CreditCard creditCard,
    required UserModel userModel,
  });

  Future<void> deleteCreditCard({
    required CreditCard creditCard,
    required UserModel userModel,
  });

  Future<void> updateCreditCard({
    required CreditCard creditCard,
    required UserModel userModel,
  });
}
