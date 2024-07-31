import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/cards/credit_card_ui_widget.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class CreditCardsSlider extends StatelessWidget {
  const CreditCardsSlider({super.key});

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

      child: Swiper(
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
        onIndexChanged: (index) {},
        itemBuilder: (BuildContext context, int index) {
          return Align(
            alignment: Alignment.center,
            child: CreditCardVisualModel(
              index: index,
            ),
          );
        },
      ),
    );
  }
}
