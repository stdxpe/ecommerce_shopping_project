import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/credit_card_screen_bg_color_provider.dart';

class TestBg extends ConsumerWidget {
  const TestBg({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color rawColor = ref.watch(colorIndexProvider);
    HSLColor color = HSLColor.fromColor(rawColor);
    return Animate(
      target: 1,

      // onComplete: (controller) {
      //   if (ref.read(colorIndexProvider.notifier).isAnimationStarted()) {
      //     // controller.repeat(max: 1);
      //     // controller.stop();
      //     controller.repeat(max: 1);

      //     controller.loop(count: 1);
      //   } else {
      //     // controller.stop();
      //   }
      //   // ? controller.stop(); controller.repeat()
      //   // : null;
      //   controller.isCompleted ? controller.stop() : null;
      // },
      effects: [
        FadeEffect(duration: 1000.ms),
      ],
      child: Container(
        height: context.mediaQuery.size.height,
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
      ),
    );
  }
}
