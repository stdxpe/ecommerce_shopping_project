import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:card_swiper/card_swiper.dart';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/credit_card_screen_bg_color_provider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/cards/credit_card_ui_widget.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/background_credit_cards_slider.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class CreditCardsSlider extends StatelessWidget {
  const CreditCardsSlider({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = context.mediaQuery.size;
    var aspectRatioVerticalToHorizontal = 0.6310583581;
    // var aspectRatioHorizontalToVertical = 1.5846394984;
    double creditCardWidth =
        (size.width - Constants.kButtonPaddingHorizontal * 2.w);
    double creditCardHeight = creditCardWidth * aspectRatioVerticalToHorizontal;
    return Container(
      clipBehavior: Clip.none,
      height: creditCardHeight + 160.h,
      child: Stack(
        children: [
          const BackgroundCreditCardsSlider(),
          Consumer(
            builder: (context, ref, child) => Swiper(
              onIndexChanged: (index) {
                ref
                    .read(creditCardBgColorProvider.notifier)
                    .setColorIndex(index);
              },
              onTap: (index) {},
              allowImplicitScrolling: false,
              outer: true,
              index: 0,
              itemCount: 5,
              autoplay: false,
              autoplayDelay: 3000,
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
