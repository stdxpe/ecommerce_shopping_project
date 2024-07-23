import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreditCardVisualModel extends StatelessWidget {
  const CreditCardVisualModel({
    super.key,
    this.paddingMain = Constants.kButtonPaddingHorizontal,
    this.aspectRatioHorizontalToVertical = 1.5846394984,
    this.aspectRatioVerticalToHorizontal = 0.6310583581,
  });

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
        // backgroundImage: AppImages.creditCardBackground,
        cardBgColor: Colors.red,
        // frontCardBorder: Border.all(width: 3, color: Colors.red),

        //  GLASSMORPH
        glassmorphismConfig: Glassmorphism(
          blurX: 10.0,
          blurY: 10.0,
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
