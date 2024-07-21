import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:ecommerce_shopping_project/ui/widgets/cards/product_card_deals.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ProductCardDealsSlider extends StatelessWidget {
  const ProductCardDealsSlider({
    super.key,
    required this.productsList,
    this.cardHeight = 500,
    this.indicatorPaddingTop = 75,
    this.isCardElevated = false,
  });

  final List productsList;
  final double? cardHeight;
  final double? indicatorPaddingTop;
  final bool? isCardElevated;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.green.withOpacity(0.5),
      height: cardHeight!.h + indicatorPaddingTop!.h,
      child: Swiper(
        index: 0,
        itemCount: productsList.length,
        itemBuilder: (context, index) => Align(
          alignment: Alignment.topCenter,
          child: ProductCardDeals(
            isCardElevated: isCardElevated,
            product: productsList[index],
            cardHeight: cardHeight!,
            descriptionPrimary: 'Rode PodMic',
            descriptionSecondary: 'Dynamic Resolution',
          ),
        ),
        pagination: SwiperPagination(
          margin: EdgeInsets.zero,
          alignment: Alignment.bottomCenter,
          builder: SwiperCustomPagination(
            builder: (context, config) {
              return AnimatedSmoothIndicator(
                duration: const Duration(milliseconds: 500),
                activeIndex: config.activeIndex,
                count: config.itemCount,
                effect: ExpandingDotsEffect(
                  dotWidth: 20.w,
                  dotHeight: 20.w,
                  spacing: 30.w,
                  activeDotColor: context.colorPalette.title,
                  dotColor: context.colorPalette.title.withOpacity(0.4),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
