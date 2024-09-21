import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uuid/uuid.dart';

import 'package:ecommerce_shopping_project/business/abstract_classes/i_profile_repository.dart';
import 'package:ecommerce_shopping_project/models/credit_card.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/user_provider.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

final creditCardsProvider =
    AsyncNotifierProvider<CreditCardsNotifier, List<CreditCard>>(
        () => CreditCardsNotifier());

class CreditCardsNotifier extends AsyncNotifier<List<CreditCard>> {
  @override
  FutureOr<List<CreditCard>> build() async {
    /// Initial State Setting Operation
    getCreditCards();

    /// Waiting for the inner method to be completed
    return await future;
  }

  final _profileManager = locator<IProfileRepository>();

  getCreditCards() async {
    debugPrint('CreditCardsNotifier | getCreditCards() Executed');

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return await _profileManager.getCreditCards(
          userModel: ref.watch(userProvider).value!);
    });
  }

  createCreditCard({
    required String cardHolder,
    required String cardNumber,
    required String validThru,
    required String cvv,
  }) async {
    debugPrint('CreditCardNotifier | createCreditCard() Executed');

    CreditCard newCreditCard = CreditCard(
      id: const Uuid().v4(),
      cardHolder: cardHolder,
      cardNumber: cardNumber,
      validThru: validThru,
      cvv: cvv,
    );

    final previousState = await future;
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        await _profileManager.createCreditCard(
          creditCard: newCreditCard,
          userModel: ref.watch(userProvider).value!,
        );

        return [...previousState, newCreditCard];
      },
      (error) {
        debugPrint(
            'CreditCardNotifier error block exec | ${error.runtimeType} | ${error.toString()} | $error');
        return true;
      },
    );
  }

  deleteCreditCard({required CreditCard creditCard}) async {
    debugPrint('CreditCardNotifier | deleteCreditCard() Executed');

    final previousState = await future;
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        await _profileManager.deleteCreditCard(
          creditCard: creditCard,
          userModel: ref.watch(userProvider).value!,
        );

        return [...previousState.where((e) => (e.id != creditCard.id))];
      },
    );
  }

  updateCreditCard({
    required CreditCard? selectedCreditCard,
    required String cardHolder,
    required String cardNumber,
    required String validThru,
    required String cvv,
  }) async {
    debugPrint('CreditCardNotifier | updateCreditCard() Executed');

    final previousState = await future;
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        if (selectedCreditCard != null) {
          CreditCard updatedCreditCard = CreditCard(
            id: selectedCreditCard.id,
            cardHolder: cardHolder,
            cardNumber: cardNumber,
            validThru: validThru,
            cvv: cvv,
          );

          int updatedIndex = previousState
              .indexWhere((element) => element.id == updatedCreditCard.id);

          List<CreditCard> latestList = previousState
              .where((element) => element.id != updatedCreditCard.id)
              .toList();

          latestList.insert(updatedIndex, updatedCreditCard);

          await _profileManager.updateCreditCard(
            creditCard: updatedCreditCard,
            userModel: ref.watch(userProvider).value!,
          );

          return latestList;
        } else {
          return [...previousState];
        }
      },
      (error) {
        debugPrint(
            'CreditCardNotifier error block exec | ${error.runtimeType} | ${error.toString()}');
        return true;
      },
    );
  }
}

final disposeCreditCardControllers = Provider<void>((ref) async {
  await Future.delayed(const Duration(seconds: 2));

  ref.read(selectedCreditCardIndex.notifier).state = 0;
  var controllers = ref.read(creditCardTextControllers);
  controllers.cardHolder.clear();
  controllers.cardNumber.clear();
  controllers.validThru.clear();
  controllers.cvv.clear();
});

final creditCardsRawList = StateProvider<List<CreditCard?>>((ref) {
  List<CreditCard?> cardsList = [null];

  if (ref.watch(creditCardsProvider).value != null) {
    cardsList = ref.watch(creditCardsProvider).value!;
    cardsList = [...cardsList, null];
  }
  return cardsList;
});

final selectedCreditCardIndex = StateProvider<int>((ref) => 0);

final selectedCreditCard = StateProvider<CreditCard?>((ref) {
  List<CreditCard?> creditCards = ref.watch(creditCardsRawList);
  int selectedIndex = ref.watch(selectedCreditCardIndex);
  return creditCards[selectedIndex];
});

/// CREDITCARD TEXTFORMFIELD CONTROLLERS
typedef CreditCardTextControllerOutputs = ({
  TextEditingController cardHolder,
  TextEditingController cardNumber,
  TextEditingController validThru,
  TextEditingController cvv,
});
final creditCardTextControllers =
    StateProvider<CreditCardTextControllerOutputs>((ref) {
  final CreditCard? selectedCard = ref.watch(selectedCreditCard);

  final TextEditingController controllerCardHolder =
      TextEditingController(text: selectedCard?.cardHolder);
  final TextEditingController controllerCardNumber =
      TextEditingController(text: selectedCard?.cardNumber);
  final TextEditingController controllerValidThru =
      TextEditingController(text: selectedCard?.validThru);
  final TextEditingController controllerCvv =
      TextEditingController(text: selectedCard?.cvv);

  return (
    cardHolder: controllerCardHolder,
    cardNumber: controllerCardNumber,
    validThru: controllerValidThru,
    cvv: controllerCvv,
  );
});

final creditCardCheckBox = StateProvider<bool>((ref) => true);

/// CREDITCARD UI LAYOUTS and DIMENSIONS
typedef CreditCardUIOutputs = ({
  double paddingMain,
  double aspectRatioVerticalToHorizontal,
  double aspectRatioHorizontalToVertical,
  double creditCardWidth,
  double creditCardHeight,
  double listViewHeight,
  double viewportFraction,
  double columnPadding,
});

final creditCardUILayouts =
    Provider.family<CreditCardUIOutputs, BuildContext>((ref, context) {
  double aspectRatioVerticalToHorizontal = 0.6310583581;
  double aspectRatioHorizontalToVertical = 1.5846394984;
  double creditCardWidth = (context.mediaQuery.size.width -
      Constants.kButtonPaddingHorizontal * 2.w);
  double creditCardHeight = creditCardWidth * aspectRatioVerticalToHorizontal;

  return (
    paddingMain: Constants.kButtonPaddingHorizontal,
    aspectRatioVerticalToHorizontal: aspectRatioVerticalToHorizontal,
    aspectRatioHorizontalToVertical: aspectRatioHorizontalToVertical,
    creditCardWidth: creditCardWidth,
    creditCardHeight: creditCardHeight,
    listViewHeight: (creditCardHeight + 160.h),
    viewportFraction: (creditCardWidth / context.mediaQuery.size.width),
    columnPadding: Constants.kMainPaddingHorizontal.w * 2,
  );
});

/// CREDITCARD BG COLOR
final creditCardBgColor = StateProvider<HSLColor>((ref) {
  int index = ref.watch(selectedCreditCardIndex) ?? 0;

  List rawColorsList = [
    const Color(0xFF6B1B9C),
    const Color(0xFF3A8F07),
    const Color(0xFFBC5A22),
    const Color(0xFF073C96),
    const Color(0xFF1A949C),
  ];
  Color rawColor = rawColorsList[index % 5];
  HSLColor hslColor = HSLColor.fromColor(rawColor);
  return hslColor;
});
