import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shimmer/shimmer.dart';

import 'package:ecommerce_shopping_project/models/dummy_data/dummy_products.dart';
import 'package:ecommerce_shopping_project/ui/widgets/%20bottom_sheets/bottom_sheet_buttons_shopping_cart.dart';
import 'package:ecommerce_shopping_project/ui/widgets/app_bars/app_bar_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/vertical_listview_product_card_horizontal_detailed.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ShimmerScreen extends StatelessWidget {
  const ShimmerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarMain(
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          height: context.mediaQuery.size.height,
          width: context.mediaQuery.size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LoadingAnimationWidget.threeArchedCircle(
                color: Colors.black,
                // leftDotColor: Colors.grey,
                // rightDotColor: Colors.orange,
                size: 100,
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  physics: const ClampingScrollPhysics(),
                  children: [
                    const TitleMain(
                      title: AppStrings.shoppingCartScreenTitle,
                      itemCount: 13,
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.black,
                      highlightColor: Colors.black54,
                      direction: ShimmerDirection.ltr,
                      child: VerticalListviewProductCardHorizontalDetailed(
                        dismissibleEnabled: true,
                        isCardElevated: false,
                        // productsList: dummyProductList,
                        productsList: dummyProducts,
                        cardHeight: 250,
                        paddingMain: Constants.kMainPaddingHorizontal,
                        paddingBetweenElements:
                            Constants.kMainSpacingBTWCardsVertical,
                      ),
                    ),
                    SizedBox(height: 100.h),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: BottomSheetButtonsShoppingCart(
                  onPressed: () {},
                  totalAmount: 210.99,
                  shippingFee: 5.99,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';

// class TestingScreen2 extends StatelessWidget {
//   const TestingScreen2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SizedBox(
//           width: 200.0,
//           height: 100.0,
//           child: Shimmer.fromColors(
//             baseColor: Colors.red,
//             highlightColor: Colors.yellow,
//             child: 
            
//             // Text(
//             //   'Shimmer',
//             //   textAlign: TextAlign.center,
//             //   style: TextStyle(
//             //     fontSize: 40.0,
//             //     fontWeight: FontWeight.bold,
//             //   ),
//             // ),
//           ),
//         ),
//       ),
//     );
//   }
// }
