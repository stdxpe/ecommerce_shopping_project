import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/deals_provider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/card_image.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/error_occured_widget.dart';
import 'package:ecommerce_shopping_project/ui/widgets/placeholders/card_placeholder_standart.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class DealsSlider extends ConsumerWidget {
  const DealsSlider(
      {super.key, this.cardHeight = 500, this.indicatorPaddingTop = 50});

  final double? cardHeight;
  final double? indicatorPaddingTop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(dealsProvider).when(
          loading: () =>
              CardPlaceholderStandart(width: 1.sw, height: cardHeight!.h),
          error: (error, stackTrace) => const ErrorOccuredWidget(),
          data: (data) => Container(
            margin: EdgeInsets.only(
                top: Constants.kHomeScreenSpacingBTWItems.h, bottom: 0.h),
            alignment: Alignment.topCenter,
            height: cardHeight!.h + indicatorPaddingTop!.h,
            child: Swiper(
              index: 0,
              itemCount: data.length,
              fade: 1,
              itemBuilder: (context, index) => Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(
                    left: Constants.kMainPaddingHorizontal.w,
                    right: Constants.kMainPaddingHorizontal.w,
                  ),
                  child: AspectRatio(
                    aspectRatio: 1.sw / cardHeight!.h,
                    child: GestureDetector(
                      onTap: () => ref
                          .read(dealsProvider.notifier)
                          .navigate(context: context, index: index),
                      child: CardImage(
                        imageUrl: data[index].photo,
                        width: 1.sw,
                        height: 500.h,
                        boxfit: BoxFit.cover,
                        clipBehavior: Clip.hardEdge,
                        useFadeInAnimation: false,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                Constants.kRadiusSliderDeals.r)),
                      ).animate().fadeIn(duration: 750.ms),
                    ),
                  ),
                ),
              ),
              pagination: SwiperPagination(
                margin: EdgeInsets.only(
                    top: cardHeight!.h + indicatorPaddingTop!.h),
                alignment: Alignment.bottomCenter,
                builder: SwiperCustomPagination(
                  builder: (context, config) {
                    return AnimatedSmoothIndicator(
                      activeIndex: config.activeIndex,
                      count: config.itemCount,
                      duration: const Duration(milliseconds: 500),
                      effect: ExpandingDotsEffect(
                        dotWidth: 20.w,
                        dotHeight: 20.w,
                        spacing: 30.w,
                        activeDotColor: context.colorPalette.title,
                        dotColor: context.colorPalette.title.withOpacity(0.4),
                      ),
                    ).animate().fadeIn(duration: 750.ms);
                  },
                ),
              ),
            ),
          ),
        );
  }
}
