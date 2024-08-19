import 'package:ecommerce_shopping_project/models/user_model.dart';
import 'package:ecommerce_shopping_project/models/address.dart';
import 'package:ecommerce_shopping_project/models/credit_card.dart';

import 'package:ecommerce_shopping_project/business/abstract_classes/i_profile_repository.dart';
import 'package:ecommerce_shopping_project/services/abstract_classes/i_user_service.dart';

import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';

class ProfileManager extends IProfileRepository {
  final _userService = locator<IUserService>();

  @override
  Future<List<Address>> getAddresses({required UserModel userModel}) async {
    try {
      print('ProfileManager getAddresses try block exec');

      return userModel.addresses;
    } on Exception catch (_) {
      print(
          'ProfileManager getAddresses catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      print('ProfileManager getAddresses catch error block exec, rethrowing');
      rethrow;
    }
  }

  @override
  Future<void> createAddress(
      {required Address address, required UserModel userModel}) async {
    try {
      print('ProfileManager createAddress try block exec');

      List<Address> tempAddresses = userModel.addresses;
      tempAddresses.add(address);

      await _userService.updateUserModel(
          userModel: userModel.copyWith(addresses: tempAddresses));
    } on Exception catch (_) {
      print(
          'ProfileManager createAddress catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      print('ProfileManager createAddress catch error block exec, rethrowing');
      rethrow;
    }
  }

  @override
  Future<void> deleteAddress(
      {required Address address, required UserModel userModel}) async {
    try {
      print('ProfileManager deleteAddress try block exec');

      List<Address> tempAddresses = userModel.addresses;

      tempAddresses.removeWhere((element) => element.id == address.id);

      await _userService.updateUserModel(
          userModel: userModel.copyWith(addresses: tempAddresses));
    } on Exception catch (_) {
      print(
          'ProfileManager deleteAddress catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      print('ProfileManager deleteAddress catch error block exec, rethrowing');
      rethrow;
    }
  }

  @override
  Future<List<CreditCard>> getCreditCards(
      {required UserModel userModel}) async {
    try {
      print('ProfileManager getCreditCards try block exec');

      return userModel.creditCards;
    } on Exception catch (_) {
      print(
          'ProfileManager getCreditCards catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      print('ProfileManager getCreditCards catch error block exec, rethrowing');
      rethrow;
    }
  }

  @override
  Future<void> createCreditCard(
      {required CreditCard creditCard, required UserModel userModel}) async {
    try {
      print('ProfileManager createCreditCard try block exec');

      List<CreditCard> tempCreditCards = userModel.creditCards;
      tempCreditCards.add(creditCard);

      await _userService.updateUserModel(
          userModel: userModel.copyWith(creditCards: tempCreditCards));
    } on Exception catch (_) {
      print(
          'ProfileManager createCreditCard catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      print(
          'ProfileManager createCreditCard catch error block exec, rethrowing');
      rethrow;
    }
  }

  @override
  Future<void> deleteCreditCard(
      {required CreditCard creditCard, required UserModel userModel}) async {
    try {
      print('ProfileManager deleteCreditCard try block exec');

      List<CreditCard> tempCreditCards = userModel.creditCards;

      tempCreditCards.removeWhere((element) => element.id == creditCard.id);

      await _userService.updateUserModel(
          userModel: userModel.copyWith(creditCards: tempCreditCards));
    } on Exception catch (_) {
      print(
          'ProfileManager deleteCreditCard catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      print(
          'ProfileManager deleteCreditCard catch error block exec, rethrowing');
      rethrow;
    }
  }
}
