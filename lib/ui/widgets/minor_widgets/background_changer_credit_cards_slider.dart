import 'package:flutter/material.dart';

import 'package:ecommerce_shopping_project/ui/widgets/sliders/credit_cards_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackgroundChangerCreditCardsSlider extends StatelessWidget {
  const BackgroundChangerCreditCardsSlider({super.key});

  @override
  Widget build(BuildContext context) {
    int outCurrentIndex = 0;
    // HSLColor color = HSLColor.fromColor(_accounts[_selectedIndex].color);

    List rawColorsList = [
      const Color(0xFF3A8F07),
      const Color(0xFF6B1B9C),
      const Color(0xFF1A949C),
      const Color(0xFF073C96),
      const Color(0xFFBC5A22),
    ];
    Color rawColor = Color(0xFF6B1B9C);
    HSLColor color = HSLColor.fromColor(rawColor);
    // color: Color(0xFF3A8F07),
    // color: Color(0xFF6B1B9C),
    // color: Color(0xFF1A949C),
    // color: Color(0xFF073C96),
    // color: Color(0xFFBC5A22),

    return Scaffold(
      backgroundColor: rawColor,
      body: Container(
        height: 1.sh,
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
        child: Padding(
          padding: EdgeInsets.only(top: 150),
          child: Align(
            alignment: Alignment.topCenter,
            child: CreditCardsSlider(
              onIndexChanged: (cardIndex) {},
            ),
          ),
        ),
      ),
    );
  }
}
