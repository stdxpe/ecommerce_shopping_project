import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zoom_pinch_overlay/zoom_pinch_overlay.dart';

import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/card_image.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class DetailsScreenSlider extends StatelessWidget {
  const DetailsScreenSlider({
    super.key,
    required this.imagesList,
    this.imageHeight,
  });

  final List imagesList;
  final double? imageHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: imageHeight ?? context.mediaQuery.size.width,
      child: Swiper(
        fade: 0,
        index: 0,
        itemCount: imagesList.length,
        autoplayDelay: 3000,
        viewportFraction: 1,
        scale: 1,
        duration: 750,
        onIndexChanged: (index) {},
        itemBuilder: (BuildContext context, int index) {
          return ZoomOverlay(
            modalBarrierColor: Colors.black12,
            minScale: 0.5,
            maxScale: 3.0,
            animationCurve: Curves.fastOutSlowIn,
            animationDuration: const Duration(
              milliseconds: 300,
            ),
            twoTouchOnly: true,
            onScaleStart: () {},
            onScaleStop: () {},
            child: Consumer(
              builder: (context, ref, child) => CardImage(
                imageUrl: imagesList[index],
                useFadeInAnimation: false,
                height: imageHeight ?? context.mediaQuery.size.width,
                width: context.mediaQuery.size.width,
              ),
            ),
          );
        },
        pagination: SwiperPagination(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.all(30.w),
          builder: SwiperCustomPagination(
            builder: (context, config) {
              return AnimatedSmoothIndicator(
                duration: const Duration(milliseconds: 500),
                activeIndex: config.activeIndex,
                count: config.itemCount,
                effect: ScrollingDotsEffect(
                  dotWidth: 20.w,
                  dotHeight: 20.w,
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
