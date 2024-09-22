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
    // List<Address> addresses = ref.watch(userProvider).value!.addresses;
    // return addresses;

    /// Initial State Setting Operation
    getAddresses();

    /// Waiting for the inner method to be completed
    return await future;
  }

  final _profileManager = locator<IProfileRepository>();

  getAddresses() async {
    debugPrint('AddressesNotifier | getAddresses() Executed');

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return await _profileManager.getAddresses(
          userModel: ref.watch(userProvider).value!);
    });
  }

  createAddress({
    required String fullName,
    required String addressTitle,
    required String addressText,
    required String city,
    required String country,
    required String zipCode,
  }) async {
    debugPrint('AddressesNotifier | createAddress() Executed');

    Address newAddress = Address(
      id: const Uuid().v4(),
      fullName: fullName,
      addressTitle: addressTitle,
      addressText: addressText,
      city: city,
      country: country,
      zipCode: zipCode,
    );

    final previousState = await future;
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        await _profileManager.createAddress(
          address: newAddress,
          userModel: ref.watch(userProvider).value!,
        );

        return [...previousState, newAddress];
      },
      (error) {
        debugPrint(
            'AddressesNotifier error block exec | ${error.runtimeType} | ${error.toString()} | $error');
        return true;
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

  updateAddress({
    required Address? selectedAddress,
    required String fullName,
    required String addressTitle,
    required String addressText,
    required String city,
    required String country,
    required String zipCode,
  }) async {
    debugPrint('AddressesNotifier | updateAddress() Executed');

    final previousState = await future;
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        if (selectedAddress != null) {
          Address updatedAddress = Address(
            id: selectedAddress.id,
            fullName: fullName,
            addressTitle: addressTitle,
            addressText: addressText,
            city: city,
            country: country,
            zipCode: zipCode,
          );

          int updatedIndex = previousState
              .indexWhere((element) => element.id == updatedAddress.id);

          List<Address> latestList = previousState
              .where((element) => element.id != updatedAddress.id)
              .toList();

          latestList.insert(updatedIndex, updatedAddress);

          await _profileManager.updateAddress(
            address: updatedAddress,
            userModel: ref.watch(userProvider).value!,
          );

          return latestList;
        } else {
          return [...previousState];
        }
      },
      (error) {
        debugPrint(
            'AddressesNotifier error block exec | ${error.runtimeType} | ${error.toString()}');
        return true;
      },
    );
  }
}

final disposeAddressControllers = Provider<void>((ref) async {
  await Future.delayed(const Duration(seconds: 2));

  ref.read(selectedAddressIndex.notifier).state = 0;
  var controllers = ref.read(addressTextControllers);
  controllers.fullName.clear();
  controllers.addressTitle.clear();
  controllers.addressText.clear();
  controllers.city.clear();
  controllers.zipCode.clear();
  controllers.country.clear();
});

final addressesRawList = StateProvider<List<Address?>>((ref) {
  List<Address?> addressesList = [null];

  if (ref.watch(addressesProvider).value != null) {
    addressesList = ref.watch(addressesProvider).value!;
    addressesList = [...addressesList, null];
  }
  return addressesList;
});

final selectedAddressIndex = StateProvider<int>((ref) {
  return ref.watch(addressesRawList).length - 1;
});

final selectedAddress = StateProvider<Address?>((ref) {
  List<Address?> addresses = ref.watch(addressesRawList);
  int selectedIndex = ref.watch(selectedAddressIndex);
  return addresses[selectedIndex];
});

/// ADDRESSES TEXTFORMFIELD CONTROLLERS
typedef AddressesTextControllerOutputs = ({
  TextEditingController fullName,
  TextEditingController addressTitle,
  TextEditingController addressText,
  TextEditingController city,
  TextEditingController zipCode,
  TextEditingController country,
});

final addressTextControllers =
    StateProvider<AddressesTextControllerOutputs>((ref) {
  final Address? selected = ref.watch(selectedAddress);

  final TextEditingController controllerFullName =
      TextEditingController(text: selected?.fullName);
  final TextEditingController controllerAddressTitle =
      TextEditingController(text: selected?.addressTitle);
  final TextEditingController controllerAddressText =
      TextEditingController(text: selected?.addressText);
  final TextEditingController controllerCity =
      TextEditingController(text: selected?.city);
  final TextEditingController controllerZipCode =
      TextEditingController(text: selected?.zipCode);
  final TextEditingController controllerCountry =
      TextEditingController(text: selected?.country);

  return (
    fullName: controllerFullName,
    addressTitle: controllerAddressTitle,
    addressText: controllerAddressText,
    city: controllerCity,
    zipCode: controllerZipCode,
    country: controllerCountry,
  );
});

final addressCheckBox = StateProvider<bool>((ref) => true);
