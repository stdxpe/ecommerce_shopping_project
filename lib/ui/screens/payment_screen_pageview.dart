import 'package:flutter/material.dart';

import 'package:ecommerce_shopping_project/ui/screens/payment_screen_payment.dart';
import 'package:ecommerce_shopping_project/ui/screens/payment_screen_result.dart';
import 'package:ecommerce_shopping_project/ui/screens/payment_screen_shipping.dart';
import 'package:ecommerce_shopping_project/ui/screens/payment_screen_summary.dart';
import 'package:ecommerce_shopping_project/ui/widgets/app_bars/app_bar_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/switches/switch_payment_status_bar_stepper.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class PaymentScreenPageview extends StatefulWidget {
  const PaymentScreenPageview({super.key});

  @override
  State<PaymentScreenPageview> createState() => _PaymentScreenPageviewState();
}

class _PaymentScreenPageviewState extends State<PaymentScreenPageview> {
  int _screenIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pageViewController = PageController(
      initialPage: 0,
      keepPage: true,
    );

    void goNextPage() {
      pageViewController.nextPage(
        duration: const Duration(milliseconds: 10),
        curve: Curves.fastOutSlowIn,
      );
    }

    void goPreviousPage() {
      pageViewController.previousPage(
        duration: const Duration(milliseconds: 10),
        curve: Curves.fastOutSlowIn,
      );
    }

    List<Widget> paymentScreens = [
      PaymentScreenShipping(
        onPressed: () {
          goNextPage();
          _screenIndex = 1;
        },
      ),
      PaymentScreenPayment(
        onPressed: () {
          goNextPage();
          _screenIndex = 2;
        },
      ),
      PaymentScreenSummary(
        onPressed: () {
          goNextPage();
          _screenIndex = 2;
        },
      ),
      PaymentScreenResult(
        onPressed: () {},
      ),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBarMain(
        automaticallyImplyLeading: true,
        useSearchButton: false,

        /// TODO: Gotta handle Android back button or swipe to back func
        onPressedBackButtonAlternate: _screenIndex != 0
            ? () {
                goPreviousPage();
              }
            : null,
      ),
      body: SizedBox(
        height: context.mediaQuery.size.height,
        width: context.mediaQuery.size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SwitchPaymentStatusBarStepper(
              activeStep: _screenIndex,
              onPressed: (index) {
                setState(() {
                  _screenIndex = index;
                });
                pageViewController.jumpToPage(_screenIndex);
              },
            ),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                clipBehavior: Clip.hardEdge,
                controller: pageViewController,

                /// TODO: Riverpod methods for pageview validation
                // physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (pageIndex) {
                  setState(() {});
                  _screenIndex = pageIndex;
                },
                scrollDirection: Axis.horizontal,
                allowImplicitScrolling: false,
                children: paymentScreens,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
