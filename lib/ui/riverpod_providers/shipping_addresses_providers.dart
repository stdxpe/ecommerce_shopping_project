import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import 'package:ecommerce_shopping_project/models/address.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/user_provider.dart';
import 'package:ecommerce_shopping_project/business/abstract_classes/i_profile_repository.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';

final addressesProvider =
    AsyncNotifierProvider<AddressesNotifier, List<Address>>(
        () => AddressesNotifier());

class AddressesNotifier extends AsyncNotifier<List<Address>> {
  @override
  FutureOr<List<Address>> build() async {
    List<Address> addresses = ref.watch(userProvider).value!.addresses;
    return addresses;
  }

  final _profileManager = locator<IProfileRepository>();

  createAddress() async {
    debugPrint('AddressesNotifier | createAddress() Executed');

    final previousState = await future;
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        Address address = Address(
          id: const Uuid().v4(),
          fullName: ref.watch(textControllerAddressFullName(null)).text,
          addressTitle: ref.watch(textControllerAddressTitle(null)).text,
          addressText: ref.watch(textControllerAddress(null)).text,
          city: ref.watch(textControllerAddressCity(null)).text,
          zipCode: ref.watch(textControllerAddressZipCode(null)).text,
          country: ref.watch(textControllerAddressCountry(null)).text,
        );

        await _profileManager.createAddress(
          address: address,
          userModel: ref.watch(userProvider).value!,
        );

        return [...previousState, address];
      },
    );
  }

  deleteAddress({required Address address}) async {
    debugPrint('AddressesNotifier | deleteAddress() Executed');

    final previousState = await future;
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        await _profileManager.deleteAddress(
          address: address,
          userModel: ref.watch(userProvider).value!,
        );

        return [...previousState.where((e) => (e.id != address.id))];
      },
    );
  }

  updateAddress({required Address initialAddress}) async {
    debugPrint('AddressesNotifier | updateAddress() Executed');

    final previousState = await future;
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        Address address = Address(
          id: initialAddress.id,
          fullName: ref
              .watch(textControllerAddressFullName(initialAddress.fullName))
              .text,
          addressTitle: ref
              .watch(textControllerAddressTitle(initialAddress.addressTitle))
              .text,
          addressText:
              ref.watch(textControllerAddress(initialAddress.addressText)).text,
          city: ref.watch(textControllerAddressCity(initialAddress.city)).text,
          zipCode: ref
              .watch(textControllerAddressZipCode(initialAddress.zipCode))
              .text,
          country: ref
              .watch(textControllerAddressCountry(initialAddress.country))
              .text,
        );

        int updatedIndex =
            previousState.indexWhere((element) => element.id == address.id);

        List<Address> latestList =
            previousState.where((element) => element.id != address.id).toList();

        latestList.insert(updatedIndex, address);

        await _profileManager.updateAddress(
          address: address,
          userModel: ref.watch(userProvider).value!,
        );

        return latestList;
      },
      (error) {
        print(
            'AddressesNotifier error block exec | ${error.runtimeType} | $error');
        return true;
      },
    );
  }

  disposeControllers() async {
    debugPrint('Address DisposeControllers waiting..');
    await Future.delayed(const Duration(seconds: 1));
    debugPrint('Address DisposeControllers waited 1 sec');

    ref.watch(textControllerAddressFullName(null)).clear();
    ref.watch(textControllerAddressTitle(null)).clear();
    ref.watch(textControllerAddress(null)).clear();
    ref.watch(textControllerAddressCity(null)).clear();
    ref.watch(textControllerAddressZipCode(null)).clear();
    ref.watch(textControllerAddressCountry(null)).clear();
  }
}

/// CREATING ADDRESS TEXTFORMFIELD CONTROLLERS

final textControllerAddressFullName =
    Provider.family<TextEditingController, String?>((ref, initialText) {
  TextEditingController controller = TextEditingController(text: initialText);
  ref.onDispose(() {
    controller.dispose();
    debugPrint('textControllerAddressFullName disposed');
  });

  return controller;
});

final textControllerAddressTitle =
    Provider.family<TextEditingController, String?>((ref, initialText) {
  TextEditingController controller = TextEditingController(text: initialText);
  ref.onDispose(() => controller.dispose());
  return controller;
});

final textControllerAddress =
    Provider.family<TextEditingController, String?>((ref, initialText) {
  TextEditingController controller = TextEditingController(text: initialText);
  ref.onDispose(() => controller.dispose());
  return controller;
});

final textControllerAddressCity =
    Provider.family<TextEditingController, String?>((ref, initialText) {
  TextEditingController controller = TextEditingController(text: initialText);
  ref.onDispose(() => controller.dispose());
  return controller;
});

final textControllerAddressZipCode =
    Provider.family<TextEditingController, String?>((ref, initialText) {
  TextEditingController controller = TextEditingController(text: initialText);
  ref.onDispose(() => controller.dispose());
  return controller;
});

final textControllerAddressCountry =
    Provider.family<TextEditingController, String?>((ref, initialText) {
  TextEditingController controller = TextEditingController(text: initialText);
  ref.onDispose(() => controller.dispose());

  return controller;
});

final addressCheckBox = StateProvider<bool>((ref) => true);
