import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/credit_card_screen_bg_color_provider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/cards/credit_card_ui_widget.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class CreditCardsSlider extends StatelessWidget {
  CreditCardsSlider({super.key, this.onIndexChanged});

  final Function(int cardIndex)? onIndexChanged;
  int currentCardIndex = 0;
  bool isStateChanged = false;

  @override
  Widget build(BuildContext context) {
    Size size = context.mediaQuery.size;
    // var aspectRatioHorizontalToVertical = 1.5846394984;
    var aspectRatioVerticalToHorizontal = 0.6310583581;
    double creditCardWidth =
        (size.width - Constants.kButtonPaddingHorizontal * 2.w);
    double creditCardHeight = creditCardWidth * aspectRatioVerticalToHorizontal;
    return Container(
      clipBehavior: Clip.none,
      // color: Colors.pink.withOpacity(0.5),
      // color: Colors.black,
      // width: 1.sw,
      height: creditCardHeight + 160.h,

      child: Stack(
        children: [
          // Container(color: Colors.red).animate().fadeIn(),
          if (currentCardIndex == currentCardIndex)
            Consumer(
              builder: (context, ref, child) {
                // ref.watch(coloredBgIndexProvider.notifier).addListener(listener)
                // return ref.listen(colorIndexProvider, (prev, next));
                // return ref.watch(coloredBgProvider);
                Color tempColor = ref.watch(colorProvider);
                // return ColoredBgWidget(color: tempColor);
                return currentCardIndex == ref.watch(coloredBgIndexProvider)
                    ? Container(
                        color: ref.watch(colorProvider),
                      )
                        .animate(
                          onPlay: (controller) {},
                        )
                        .fade(duration: 1000.ms, delay: 1.ms)
                    : SizedBox();
              },
            ),

          Consumer(
            builder: (context, ref, child) => Swiper(
              onIndexChanged: (index) {
                ref.read(coloredBgIndexProvider.notifier).state = index;
                print(
                    'ref(coloredBgIndexProvider): ${ref.read(coloredBgIndexProvider)}');
                currentCardIndex = 0;
                currentCardIndex = index;
                print('ref(currentCardIndex): $currentCardIndex}');
                isStateChanged = true;
                onIndexChanged!(index);
              },
              onTap: (index) {},
              allowImplicitScrolling: false,
              outer: true,
              index: 0,
              itemCount: 5,
              // autoplay: true,
              autoplayDelay: 3000,
              // viewportFraction: 0.83,
              viewportFraction: (creditCardWidth / size.width),
              scale: 0.85,
              duration: 750,
              itemBuilder: (BuildContext context, int index) {
                return Align(
                  alignment: Alignment.center,
                  child: CreditCardVisualModel(
                    index: index,
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

class ColoredBgWidget extends StatelessWidget {
  const ColoredBgWidget({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    )
        .animate(
          onPlay: (controller) {},
        )
        .fade(duration: 1000.ms, delay: 1.ms);
  }
}
