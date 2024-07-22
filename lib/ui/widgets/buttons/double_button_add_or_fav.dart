import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/buttons/button_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/buttons/icon_button_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class DoubleButtonAddOrFav extends StatelessWidget {
  const DoubleButtonAddOrFav({
    super.key,
    this.paddingHorizontal,
  });
  final double? paddingHorizontal;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorPalette.scaffoldBackground,
      padding: EdgeInsets.only(
        top: Constants.kButtonPaddingTop.h,
        bottom: Constants.kButtonPaddingBottom.h,
        left: paddingHorizontal ??
            Constants.kDetailsScreenMainPaddingHorizontal.w,
        right: paddingHorizontal ??
            Constants.kDetailsScreenMainPaddingHorizontal.w,
      ),
      child: Row(
        children: [
          Expanded(
            child: ButtonMain(
              onPressed: () {},
              text: AppStrings.detailsScreenButtonAddToShoppingCart,
              backgroundColor:
                  context.colorPalette.buttonMainBackgroundSecondary,
              foregroundColor:
                  context.colorPalette.buttonMainForegroundSecondary,
              // borderWidth: 2,
              // useShadow: false,
              paddingHorizontal: 0,
            ),
          ),
          SizedBox(width: 50.w),
          IconButtonMain(
            onPressed: () {},
            foregroundColor: ColorPalette.favoriteRed,
          ),
        ],
      ),
    );
  }
}
