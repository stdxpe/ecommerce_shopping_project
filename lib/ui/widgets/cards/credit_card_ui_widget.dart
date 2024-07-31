import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class CreditCardVisualModel extends StatelessWidget {
  const CreditCardVisualModel({
    super.key,
    this.paddingMain = Constants.kButtonPaddingHorizontal,
    this.aspectRatioHorizontalToVertical = 1.5846394984,
    this.aspectRatioVerticalToHorizontal = 0.6310583581,
    required this.index,
  });

  final int index;
  final double? paddingMain;
  final double? aspectRatioVerticalToHorizontal;
  final double? aspectRatioHorizontalToVertical;
  @override
  Widget build(BuildContext context) {
    Size size = context.mediaQuery.size;
    double creditCardWidth = (size.width - paddingMain! * 2.w);
    double creditCardHeight =
        creditCardWidth * aspectRatioVerticalToHorizontal!;
    return Container(
      clipBehavior: Clip.none,
      // color: Colors.green.withOpacity(0.5),
      child: CreditCardWidget(
        // backgroundImage: AppImages.creditCardBackground2,
        backgroundImage: 'assets/images/digital_wallet/wallet-$index.jpg',
        // backgroundImage: 'assets/images/credit_card_bg.jpg',
        // backgroundImage: 'assets/images/credit_card_bg.png',

        // backgroundImage: AppImages.blackBg,
        // cardBgColor: Colors.black,
        // cardBgColor: Colors.red,
        // frontCardBorder: Border.all(width: 0, color: Colors.transparent),

        //  GLASSMORPH
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
        height: creditCardHeight,
        width: (size.width - paddingMain! * 2.w),
        bankName: ' ',
        cardNumber: "5555 5555 5555 6656",
        expiryDate: "12/23",
        cardHolderName: "JANE DOE",
        isHolderNameVisible: true,
        // cardBgColor: Colors.red,
        cvvCode: '321',
        obscureCardNumber: false,
        obscureCardCvv: false,
        showBackView: false,
        onCreditCardWidgetChange: (CreditCardBrand brand) {},
      ),
    );
  }
}
