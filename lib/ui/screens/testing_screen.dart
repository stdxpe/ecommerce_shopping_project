import 'package:ecommerce_shopping_project/ui/widgets/%20bottom_sheets/bottom_sheet_buttons_payment_shipping.dart';
import 'package:ecommerce_shopping_project/ui/widgets/buttons/button_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/textformfield_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestingScreen extends StatelessWidget {
  const TestingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    print('//////////////////');
    print('keyboardIsOpen : ${keyboardIsOpen}');
    return Scaffold(
      body: Container(
        color: Colors.red.withOpacity(0.5),
        // height: context.mediaQuery.size.height -
        //     (Constants.kButtonPaddingBottom.h + 60.h + 150.h),
        height: context.mediaQuery.size.height,
        width: context.mediaQuery.size.width,
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextformfieldMain(
              text: AppStrings.paymentScreenShippingTextField4,
              autoFocus: true,
            ),
            ListView(
              padding: EdgeInsets.zero,
              children: [
                TextformfieldMain(
                  text: AppStrings.paymentScreenShippingTextField4,
                  autoFocus: true,
                ),
                TextformfieldMain(
                  text: AppStrings.paymentScreenShippingTextField4,
                  autoFocus: true,
                ),
                TextformfieldMain(
                  text: AppStrings.paymentScreenShippingTextField4,
                  autoFocus: true,
                ),
                TextformfieldMain(
                  text: AppStrings.paymentScreenShippingTextField4,
                  autoFocus: true,
                ),
                TextformfieldMain(
                  text: AppStrings.paymentScreenShippingTextField4,
                  autoFocus: true,
                ),
                TextformfieldMain(
                  text: AppStrings.paymentScreenShippingTextField4,
                  autoFocus: true,
                ),
                TextformfieldMain(
                  text: AppStrings.paymentScreenShippingTextField4,
                  autoFocus: true,
                ),
                TextformfieldMain(
                  text: AppStrings.paymentScreenShippingTextField4,
                  autoFocus: true,
                ),
                TextformfieldMain(
                  text: AppStrings.paymentScreenShippingTextField4,
                  autoFocus: true,
                ),
                TextformfieldMain(
                  text: AppStrings.paymentScreenShippingTextField4,
                  autoFocus: true,
                ),
                TextformfieldMain(
                  text: AppStrings.paymentScreenShippingTextField4,
                  autoFocus: true,
                ),
                TextformfieldMain(
                  text: AppStrings.paymentScreenShippingTextField4,
                  autoFocus: true,
                ),
                TextformfieldMain(
                  text: AppStrings.paymentScreenShippingTextField4,
                  autoFocus: true,
                ),
                TextformfieldMain(
                  text: AppStrings.paymentScreenShippingTextField4,
                  autoFocus: true,
                ),
                TextformfieldMain(
                  text: AppStrings.paymentScreenShippingTextField4,
                  autoFocus: true,
                ),
                TextformfieldMain(
                  text: AppStrings.paymentScreenShippingTextField4,
                  autoFocus: true,
                ),
                TextformfieldMain(
                  text: AppStrings.paymentScreenShippingTextField4,
                  autoFocus: true,
                ),
                TextformfieldMain(
                  text: AppStrings.paymentScreenShippingTextField4,
                  autoFocus: true,
                ),
                TextformfieldMain(
                  text: AppStrings.paymentScreenShippingTextField4,
                  autoFocus: true,
                ),
                TextformfieldMain(
                  text: AppStrings.paymentScreenShippingTextField4,
                  autoFocus: true,
                ),
                TextformfieldMain(
                  text: AppStrings.paymentScreenShippingTextField4,
                  autoFocus: true,
                ),
                TextformfieldMain(
                  text: AppStrings.paymentScreenShippingTextField4,
                  autoFocus: true,
                ),
                TextformfieldMain(
                  text: AppStrings.paymentScreenShippingTextField4,
                  autoFocus: true,
                ),
                TextformfieldMain(
                  text: AppStrings.paymentScreenShippingTextField4,
                  autoFocus: true,
                ),
                TextformfieldMain(
                  text: AppStrings.paymentScreenShippingTextField4,
                  autoFocus: true,
                ),
                TextformfieldMain(
                  text: AppStrings.paymentScreenShippingTextField4,
                  autoFocus: true,
                ),
                TextformfieldMain(
                  text: AppStrings.paymentScreenShippingTextField4,
                  autoFocus: true,
                ),
                SizedBox(height: 300.h),
              ],
            ),
            Align(
              alignment: keyboardIsOpen
                  ? FractionalOffset(0.5, 1.2)
                  : FractionalOffset(0.5, 1.0),
              // child: FlutterLogo(size: 200),
              // child: BottomSheetButtonsPaymentShipping(onPressed: () {}),
              child: Container(
                color: context.colorPalette.sheetBackground,
                padding: EdgeInsets.only(
                  bottom: Constants.kButtonPaddingBottom.h,
                  top: 60.h,
                ),
                child: ButtonMain(
                  onPressed: () {},
                  text: 'Continue',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
