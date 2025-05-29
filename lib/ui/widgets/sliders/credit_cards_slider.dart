import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/credit_card_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/cards/credit_card_ui_widget.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/background_credit_cards_slider.dart';

class CreditCardsSlider extends ConsumerWidget {
  const CreditCardsSlider({super.key, this.isCvvFocused = false});

  final bool? isCvvFocused;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CreditCardUIOutputs ui = ref.watch(creditCardUILayouts(context));
    var controllers = ref.watch(creditCardTextControllers);

    return Container(
      clipBehavior: Clip.none,
      height: ui.listViewHeight,
      child: Stack(
        children: [
          const BackgroundCreditCardsSlider(),
          Consumer(
            builder: (context, ref, child) => Swiper(
              onIndexChanged: (index) =>
                  ref.read(selectedCreditCardIndex.notifier).state = index,
              onTap: (index) {},
              allowImplicitScrolling: false,
              outer: true,
              index: ref.watch(selectedCreditCardIndex),
              itemCount: ref.watch(creditCardsRawList).length,
              autoplay: false,
              autoplayDelay: 3000,
              viewportFraction: ui.viewportFraction,
              scale: 0.85,
              duration: 750,
              itemBuilder: (BuildContext context, int index) {
                return Align(
                  alignment: Alignment.center,
                  child: CreditCardVisualModel(
                    index: index,
                    isCvvFocused: isCvvFocused,
                    cardHolder: controllers.cardHolder.text,
                    cardNumber: controllers.cardNumber.text,
                    validThru: controllers.validThru.text,
                    cvv: controllers.cvv.text,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
