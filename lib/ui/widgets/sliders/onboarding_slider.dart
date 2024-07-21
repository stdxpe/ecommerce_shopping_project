import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:ecommerce_shopping_project/models/dummy_sliders_list.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class OnboardingSlider extends StatelessWidget {
  const OnboardingSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 1.sw,
      height: 1390.h,
      child: Swiper(
        index: 0,
        itemCount: 4,
        autoplay: true,
        autoplayDelay: 3000,
        viewportFraction: 0.69,
        scale: 0.8,
        duration: 750,
        onIndexChanged: (index) {},
        itemBuilder: (BuildContext context, int index) {
          return Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 167.h, bottom: 150.h),
              child: Card(
                margin: EdgeInsets.zero,
                child: Container(
                  width: 739.w,
                  height: 1039.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        sliderList[index],
                      ),
                    ),
                    borderRadius: BorderRadius.circular(
                      Constants.kRadiusCardPrimary.r,
                    ),
                    boxShadow: [
                      BoxShadows.kBoxShadowOnboardingCard(
                        color: context.colorPalette.shadowSecondary,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        pagination: SwiperCustomPagination(
            builder: (BuildContext context, SwiperPluginConfig config) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedSmoothIndicator(
              duration: const Duration(milliseconds: 500),
              activeIndex: config.activeIndex,
              count: 4,
              effect: WormEffect(
                dotWidth: 30.w,
                dotHeight: 30.w,
                spacing: 34.w,
                activeDotColor: context.colorPalette.title,
                dotColor: context.colorPalette.title.withOpacity(0.3),
              ),
            ),
          );
        }),
      ),
    );
  }
}
