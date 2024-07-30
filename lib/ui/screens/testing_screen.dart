import 'package:ecommerce_shopping_project/models/dummy_product_list.dart';
import 'package:ecommerce_shopping_project/ui/widgets/%20bottom_sheets/bottom_sheet_buttons_payment_shipping.dart';
import 'package:ecommerce_shopping_project/ui/widgets/buttons/button_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/cards/product_card_horizontal_mini.dart';
import 'package:ecommerce_shopping_project/ui/widgets/dismissible_delete_widget.dart';
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
    var paddingMain = Constants.kMainPaddingHorizontal;
    var paddingBetweenElements = Constants.kMainSpacingBTWCardsHorizontal;
    return Scaffold(
      body: SafeArea(
        child: Container(
          // color: Colors.red.withOpacity(0.5),
          // height: context.mediaQuery.size.height -
          //     (Constants.kButtonPaddingBottom.h + 60.h + 150.h),
          height: context.mediaQuery.size.height,
          width: context.mediaQuery.size.width,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  // padding: EdgeInsets.symmetric(horizontal: paddingMain.w),
                  physics: const ClampingScrollPhysics(),
                  clipBehavior: Clip.none,
                  // itemExtent: 200.h + paddingBetweenElements.w,

                  itemCount: dummyProductList.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return DismissibleDeleteWidget(
                      uniqueKey: '$index',
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: paddingBetweenElements.w / 2,
                          top: paddingBetweenElements.w / 2,
                          left: paddingMain.w,
                          right: paddingMain.w,
                        ),
                        child: ProductCardHorizontalMini(
                          product: dummyProductList[index],
                          // isCardElevated: false,
                          useSoftShadow: true,
                          cardWidth: 1.sw,
                          cardHeight: 200,
                        ),
                      ),
                    );
                  },
                ),
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
      ),
    );
  }
}
