import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/credit_card_providers.dart';

class BackgroundCreditCardsSlider extends ConsumerWidget {
  const BackgroundCreditCardsSlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var color = ref.watch(creditCardBgColor);

    return AnimatedContainer(
      duration: 350.ms,
      curve: Curves.easeIn,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withLightness(color.lightness * 0.1).toColor(),
            color.withLightness(color.lightness * 0.3).toColor(),
            color.toColor(),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
