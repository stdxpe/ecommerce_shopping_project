import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/credit_card_providers.dart';

class CreditCardVisualModel extends ConsumerWidget {
  const CreditCardVisualModel({
    super.key,
    required this.index,
    required this.cardNumber,
    required this.cardHolder,
    required this.validThru,
    required this.cvv,
    this.isCvvFocused = false,
  });

  final int index;
  final String cardNumber;
  final String cardHolder;
  final String validThru;
  final String cvv;
  final bool? isCvvFocused;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CreditCardUIOutputs ui = ref.watch(creditCardUILayouts(context));

    return Container(
      clipBehavior: Clip.none,
      child: CreditCardWidget(
        glassmorphismConfig: Glassmorphism(
          blurX: 1.0,
          blurY: 1.0,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Colors.grey.withAlpha(20),
              Colors.white.withAlpha(20),
            ],
            stops: const <double>[
              0.3,
              0,
            ],
          ),
        ),
        padding: 0,
        height: ui.creditCardHeight,
        width: ui.creditCardWidth,
        bankName: ' ',
        cardNumber: cardNumber,
        cardHolderName: cardHolder,
        expiryDate: validThru,
        cvvCode: cvv,
        isHolderNameVisible: true,
        obscureCardNumber: false,
        obscureCardCvv: false,
        showBackView:
            ref.watch(selectedCreditCardIndex) == index ? isCvvFocused! : false,
        onCreditCardWidgetChange: (CreditCardBrand brand) {},
        backgroundImage: 'assets/images/digital_wallet/wallet-${index % 5}.jpg',

        /// Leave NULL for Auto Detection
        // cardType: CardType.mastercard,
      ),
    );
  }
}
