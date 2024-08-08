import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/models/order_product.dart';
import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/shopping_cart_providers.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/wishlist_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/buttons/button_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/buttons/icon_button_like.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class DoubleButtonAddOrFav extends ConsumerWidget {
  const DoubleButtonAddOrFav({
    super.key,
    required this.product,
    this.paddingHorizontal,
  });

  final Product product;
  final double? paddingHorizontal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: context.colorPalette.scaffoldBackground,
      padding: EdgeInsets.only(
        top: Constants.kButtonPaddingTop.h,
        bottom: Constants.kButtonPaddingBottom.h,
        left: paddingHorizontal ??
            Constants.kDetailsScreenMainPaddingHorizontal.w,
        // Constants.kButtonPaddingHorizontal.w,
        right: paddingHorizontal ??
            Constants.kDetailsScreenMainPaddingHorizontal.w,
        // Constants.kButtonPaddingHorizontal.w,
      ),
      child: Row(
        children: [
          Expanded(
            child: ButtonMain(
              onPressed: () {
                ref
                    .read(shoppingCartProvider.notifier)
                    .addProductToShoppingCart(
                        orderProduct: OrderProduct(
                            id: 'gottaBeRandom',
                            selectedProduct: product,
                            selectedColor: 'Dark Blue',
                            selectedSize: 'XM',
                            itemCount: 23));
              },
              text: AppStrings.detailsScreenButtonAddToShoppingCart,
              backgroundColor:
                  context.colorPalette.buttonMainBackgroundSecondary,
              foregroundColor:
                  context.colorPalette.buttonMainForegroundSecondary,
              // backgroundColor: context.colorPalette.buttonMainBackgroundPrimary,
              // foregroundColor: context.colorPalette.buttonMainForegroundPrimary,
              // borderWidth: 2,
              // useShadow: false,
              paddingHorizontal: 0,
            ),
          ),
          SizedBox(width: 50.w),
          IconButtonLike(
            // isProductOnWishlist: ref.watch(isProductOnWishlist(productId)),
            // onPressed: () => ref.read(toggleLikeButtonProvider(productId)),
            isProductOnWishlist: ref.watch(isProductOnWishlist(product.id)),
            onPressed: () => ref.read(toggleLikeButtonProvider(product.id)),
          ),
        ],
      ),
    );
  }
}
