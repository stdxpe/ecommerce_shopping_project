import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/banner_provider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/card_image.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/error_occured_widget.dart';
import 'package:ecommerce_shopping_project/ui/widgets/placeholders/card_placeholder_standart.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class BannerSlider extends ConsumerStatefulWidget {
  const BannerSlider({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BannerSliderState();
}

class _BannerSliderState extends ConsumerState<BannerSlider> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ref.watch(bannerProvider).when(
          loading: () => CardPlaceholderStandart(width: 1.sw, height: 800.h),
          error: (error, stackTrace) => const ErrorOccuredWidget(),
          data: (data) {
            return Container(
              width: 1.sw,
              height: 800.h,
              clipBehavior: Clip.none,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadows.kBoxShadowTopBanner(
                    color: context.colorPalette.shadowSecondary,
                  ),
                ],
              ),
              child: Swiper(
                fade: 1,
                index: activeIndex,
                itemCount: data.length,
                autoplay: true,
                autoplayDelay: 5000,
                viewportFraction: 1,
                scale: 1,
                duration: 600,
                onIndexChanged: (index) => setState(() => activeIndex = index),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => ref
                        .read(bannerProvider.notifier)
                        .navigate(context: context, index: index),
                    child: CardImage(
                      imageUrl: data[index].photo,
                      width: 1.sw,
                      boxfit: BoxFit.fitWidth,
                      clipBehavior: Clip.none,
                      useFadeInAnimation: false,
                    ).animate().fadeIn(duration: 1000.ms),
                  );
                },
                pagination: SwiperPagination(
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.all(40.w),
                  builder: SwiperCustomPagination(
                    builder: (context, config) {
                      return AnimatedSmoothIndicator(
                        duration: const Duration(milliseconds: 400),
                        activeIndex: config.activeIndex,
                        count: config.itemCount,
                        effect: ExpandingDotsEffect(
                          dotWidth: 15.w,
                          dotHeight: 15.w,
                          spacing: 15.w,
                          activeDotColor: context.colorPalette.permaWhiteColor,
                          dotColor: context.colorPalette.permaWhiteColor
                              .withOpacity(0.5),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ).animate().fadeIn(duration: 1000.ms, curve: Curves.easeIn);
          },
        );
  }
}
