import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/ui/widgets/buttons/double_button_add_or_fav.dart';
import 'package:ecommerce_shopping_project/ui/widgets/sliders/details_screen_slider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/switches/switch_rating_stars.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_product_detail.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const AppBarMain(),
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          height: context.mediaQuery.size.height,
          width: context.mediaQuery.size.width,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    DetailsScreenSlider(
                      // imageHeight: 1426.h,
                      imageHeight: context.mediaQuery.size.height * 0.63,
                      imagesList: const [
                        /// TODO: Images gotta come from Product model class.
                        AppImages.productImage10,
                        AppImages.productImage12,
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: Constants.kDetailsScreenTitlePaddingTop.h,
                        left: Constants.kDetailsScreenMainPaddingHorizontal.w,
                        right: Constants.kDetailsScreenMainPaddingHorizontal.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleProductDetail(
                            title: product.title,
                            price: product.price,
                            droppedPrice: 108.99,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: Constants
                                    .kDetailsScreenSpacingBTWItemsVertical.h,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Flexible(
                                    child: SwitchRatingStars(
                                      rating: 3.5,
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: TextCustom(
                                      /// TODO: Reviews count gotta come from Product model class.
                                      text: '  13 Reviews',
                                      textStyle:
                                          context.textTheme.displayMedium!,
                                      color: context.colorPalette.text,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          TextCustom(
                            text:

                                /// TODO: Description gotta come from Product model class.

                                'Maxwel welted sole  construction deliversMaxwel welted sole  construction delivers exceptional and Maxwel welted sole  construction delivers exceptional and exceptional and Maxwel welted sole  construction delivers exceptional andMaxwel welted sole  construction delivers exceptional andMaxwel welted sole  construction delivers exceptional andMaxwel welted sole  construction delivers exceptional andand durability, and is Maxwel welted sole ended construction and delivers exceptional durability, and',
                            textStyle: context.textTheme.displayMedium!,
                            color: context.colorPalette.text,
                            maxLines: 4,
                            isHeightConstraintRelated: false,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: DoubleButtonAddOrFav(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
