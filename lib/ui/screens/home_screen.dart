import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/sliders/home_slider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_with_text_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.5),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        physics: const ClampingScrollPhysics(),
        children: [
          const HomeSlider(),
          TitleWithTextButton(
            onPressed: () {
              print('onpressed');
            },
            title: 'Designer Collection',
            buttonText: 'See All',
          ),
          SizedBox(height: 7.5.h),
          TitleMain(
            onPressed: () {
              print('onpressed');
            },
            title: 'Search',
            itemCount: 13,
            icon: Icons.close,
          ),
          SizedBox(height: 7.5.h),
          TitleMain(
            title: 'Wishlist',
          ),
          SizedBox(height: 7.5.h),
          TitleMain(
            title: AppStrings.paymentScreenTitleShipping,
            stepNumber: 1,
          ),
        ],
      ),
    );
  }
}
