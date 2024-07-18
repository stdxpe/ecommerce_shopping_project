import 'package:flutter/material.dart';
import 'package:flutter_any_logo/flutter_logo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:ecommerce_shopping_project/ui/widgets/top_banners/top_sliding_content.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({super.key});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  List<Widget> sliderList = [
    DummyTopSlidingContent(
        image: AppImages.productImage1, logo: AnyLogo.fashion.adidas.path),
    DummyTopSlidingContent(
        image: AppImages.productImage0, logo: AnyLogo.fashion.bershka.path),
    DummyTopSlidingContent(
        image: AppImages.productImage11, logo: AnyLogo.fashion.chanel.path),
    DummyTopSlidingContent(
        image: AppImages.productImage12, logo: AnyLogo.fashion.gap.path),
  ];
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 800.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadows.kBoxShadowSecondary(
            color: context.theme.colorPalette.shadowSecondary,
          ),
        ],
      ),
      child: Swiper(
        fade: 0,
        index: activeIndex,
        itemCount: 4,
        autoplay: true,
        autoplayDelay: 3000,
        viewportFraction: 1,
        scale: 1,
        duration: 750,
        onIndexChanged: (index) {
          setState(
            () {
              activeIndex = index;
            },
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 2,
            margin: EdgeInsets.zero,
            child: SizedBox(
              width: 1.sw,
              height: 800.h,
              child: sliderList[index],
            ),
          );
        },
        pagination: SwiperPagination(
          alignment: Alignment.bottomLeft,
          margin: EdgeInsets.all(50.w),
          builder: SwiperCustomPagination(
            builder: (context, config) {
              return AnimatedSmoothIndicator(
                duration: const Duration(milliseconds: 500),
                activeIndex: config.activeIndex,
                count: config.itemCount,
                effect: ExpandingDotsEffect(
                  dotWidth: 25.w,
                  dotHeight: 25.w,
                  spacing: 34.w,
                  activeDotColor: context.theme.colorPalette.permaWhiteColor,
                  dotColor: context.theme.colorPalette.permaWhiteColor
                      .withOpacity(0.5),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
