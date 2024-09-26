import 'dart:io';

import 'package:ecommerce_shopping_project/services/abstract_classes/i_storage_service.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_shopping_project/business/abstract_classes/i_profile_repository.dart';
import 'package:ecommerce_shopping_project/models/address.dart';
import 'package:ecommerce_shopping_project/models/credit_card.dart';
import 'package:ecommerce_shopping_project/models/user_model.dart';
import 'package:ecommerce_shopping_project/services/abstract_classes/i_user_service.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';

class ProfileManager extends IProfileRepository {
  final _userService = locator<IUserService>();
  final _storageService = locator<IStorageService>();

  @override
  Future<void> updateProfile(
      {required String username,
      required String phoneNumber,
      required String birthday,
      required UserModel userModel}) async {
    try {
      debugPrint('ProfileManager updateProfile try block exec');

      await _userService.updateUserModel(
          userModel: userModel.copyWith(
              username: username, phone: phoneNumber, birthday: birthday));
    } on Exception catch (_) {
      debugPrint(
          'ProfileManager updateProfile catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      debugPrint(
          'ProfileManager updateProfile catch error block exec, rethrowing');
      rethrow;
    }
  }

  @override
  Future<String?> updateProfilePhoto({required UserModel userModel}) async {
    try {
      debugPrint('ProfileManager updateProfilePhoto try block exec');

      File? file = await _storageService.selectImageFromGallery();

      if (file != null) {
        debugPrint(file.toString());
        String relativePath = await _storageService.uploadImage(
            file: file, path: "/users/pp_${userModel.id}");

        String url =
            await _storageService.getImageUrl(imageRelativePath: relativePath);

        await _userService.updateUserModel(
            userModel: userModel.copyWith(photo: url));

        return url;
      } else {
        return null;
      }
    } on Exception catch (_) {
      debugPrint(
          'ProfileManager updateProfilePhoto catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      debugPrint(
          'ProfileManager updateProfilePhoto catch error block exec, rethrowing');
      rethrow;
    }
  }

  @override
  Future<List<Address>> getAddresses({required UserModel userModel}) async {
    try {
      debugPrint('ProfileManager getAddresses try block exec');

      List<Address> tempAddresses = [];

      for (var address in userModel.addresses) {
        tempAddresses.add(address);
      }
      return tempAddresses;
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
  Future<void> updateAddress(
      {required Address address, required UserModel userModel}) async {
    try {
      debugPrint('ProfileManager updateAddress try block exec');

      List<Address> tempAddresses = userModel.addresses;

      int updatedIndex =
          tempAddresses.indexWhere((element) => element.id == address.id);

      tempAddresses.removeAt(updatedIndex);

      tempAddresses.insert(updatedIndex, address);

      await _userService.updateUserModel(
          userModel: userModel.copyWith(addresses: tempAddresses));
    } on Exception catch (_) {
      debugPrint(
          'ProfileManager updateAddress catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      debugPrint(
          'ProfileManager updateAddress catch error block exec, rethrowing');
      rethrow;
    }
  }

  @override
  Future<List<CreditCard>> getCreditCards(
      {required UserModel userModel}) async {
    try {
      debugPrint('ProfileManager getCreditCards try block exec');

      List<CreditCard> tempCreditCards = [];

      for (var card in userModel.creditCards) {
        tempCreditCards.add(card);
      }
      return tempCreditCards;
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
      debugPrint('ProfileManager tempCreditCards: $tempCreditCards');

      tempCreditCards.add(creditCard);
      debugPrint('ProfileManager tempCreditCards2: $tempCreditCards');

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

  @override
  Future<void> updateCreditCard(
      {required CreditCard creditCard, required UserModel userModel}) async {
    try {
      debugPrint('ProfileManager updateCreditCard try block exec');

      List<CreditCard> tempCreditCards = userModel.creditCards;

      int updatedIndex =
          tempCreditCards.indexWhere((element) => element.id == creditCard.id);

      tempCreditCards.removeAt(updatedIndex);

      tempCreditCards.insert(updatedIndex, creditCard);

      await _userService.updateUserModel(
          userModel: userModel.copyWith(creditCards: tempCreditCards));
    } on Exception catch (_) {
      debugPrint(
          'ProfileManager updateCreditCard catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      debugPrint(
          'ProfileManager updateCreditCard catch error block exec, rethrowing');
      rethrow;
    }
  }
}
