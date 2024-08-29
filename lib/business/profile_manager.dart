import 'package:flutter/material.dart';

import 'package:ecommerce_shopping_project/business/abstract_classes/i_profile_repository.dart';
import 'package:ecommerce_shopping_project/models/address.dart';
import 'package:ecommerce_shopping_project/models/credit_card.dart';
import 'package:ecommerce_shopping_project/models/user_model.dart';
import 'package:ecommerce_shopping_project/services/abstract_classes/i_user_service.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';

class ProfileManager extends IProfileRepository {
  final _userService = locator<IUserService>();

  @override
  Future<List<Address>> getAddresses({required UserModel userModel}) async {
    try {
      debugPrint('ProfileManager getAddresses try block exec');

      return userModel.addresses;
    } on Exception catch (_) {
      debugPrint(
          'ProfileManager getAddresses catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      debugPrint(
          'ProfileManager getAddresses catch error block exec, rethrowing');
      rethrow;
    }
  }

  @override
  Future<void> createAddress(
      {required Address address, required UserModel userModel}) async {
    try {
      debugPrint('ProfileManager createAddress try block exec');

      List<Address> tempAddresses = userModel.addresses;
      tempAddresses.add(address);

      await _userService.updateUserModel(
          userModel: userModel.copyWith(addresses: tempAddresses));
    } on Exception catch (_) {
      debugPrint(
          'ProfileManager createAddress catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      debugPrint(
          'ProfileManager createAddress catch error block exec, rethrowing');
      rethrow;
    }
  }

  @override
  Future<void> deleteAddress(
      {required Address address, required UserModel userModel}) async {
    try {
      debugPrint('ProfileManager deleteAddress try block exec');

      List<Address> tempAddresses = userModel.addresses;

      tempAddresses.removeWhere((element) => element.id == address.id);

      await _userService.updateUserModel(
          userModel: userModel.copyWith(addresses: tempAddresses));
    } on Exception catch (_) {
      debugPrint(
          'ProfileManager deleteAddress catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      debugPrint(
          'ProfileManager deleteAddress catch error block exec, rethrowing');
      rethrow;
    }
  }

  @override
  Future<List<CreditCard>> getCreditCards(
      {required UserModel userModel}) async {
    try {
      debugPrint('ProfileManager getCreditCards try block exec');

      return userModel.creditCards;
    } on Exception catch (_) {
      debugPrint(
          'ProfileManager getCreditCards catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      debugPrint(
          'ProfileManager getCreditCards catch error block exec, rethrowing');
      rethrow;
    }
  }

  @override
  Future<void> createCreditCard(
      {required CreditCard creditCard, required UserModel userModel}) async {
    try {
      debugPrint('ProfileManager createCreditCard try block exec');

      List<CreditCard> tempCreditCards = userModel.creditCards;
      tempCreditCards.add(creditCard);

      await _userService.updateUserModel(
          userModel: userModel.copyWith(creditCards: tempCreditCards));
    } on Exception catch (_) {
      debugPrint(
          'ProfileManager createCreditCard catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      debugPrint(
          'ProfileManager createCreditCard catch error block exec, rethrowing');
      rethrow;
    }
  }

  @override
  Future<void> deleteCreditCard(
      {required CreditCard creditCard, required UserModel userModel}) async {
    try {
      debugPrint('ProfileManager deleteCreditCard try block exec');

      List<CreditCard> tempCreditCards = userModel.creditCards;

      tempCreditCards.removeWhere((element) => element.id == creditCard.id);

      await _userService.updateUserModel(
          userModel: userModel.copyWith(creditCards: tempCreditCards));
    } on Exception catch (_) {
      debugPrint(
          'ProfileManager deleteCreditCard catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      debugPrint(
          'ProfileManager deleteCreditCard catch error block exec, rethrowing');
      rethrow;
    }
  }
}
