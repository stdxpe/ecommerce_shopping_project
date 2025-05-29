import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/buttons/button_circular_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class SwitchItemCounter extends StatelessWidget {
  const SwitchItemCounter({
    this.itemCount = 1,
    this.itemPaddingHorizontal = 0,
    super.key,
    required this.onPressedDecrease,
    required this.onPressedIncrease,
  });

  final int itemCount;
  final double? itemPaddingHorizontal;
  final Function() onPressedDecrease;
  final Function() onPressedIncrease;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorPalette.cardBackground,
        boxShadow: [
          BoxShadows.kBoxShadowProductCard(
              color: context.colorPalette.shadowSecondary.withOpacity(0.2))
        ],
        borderRadius: BorderRadius.circular(Constants.kRadiusItemCounter.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          ButtonCircularMain(
            onPressed: () => onPressedDecrease(),
            iconColor: context.colorPalette.text,
            buttonColor: context.colorPalette.cardBackground,
            icon: CupertinoIcons.minus,
            buttonSize: 75,
            iconSize: 45,
            useShadow: false,
          ),
          SizedBox(
            width: 52.w,
            child: TextCustom(
              text: itemCount.toString(),
              textStyle: context.textTheme.bodyMedium!,
              color: context.colorPalette.text.withOpacity(0.8),
              fontSizeCustom: 38,
              fontWeightCustom: FontWeight.w500,
              textAlignCustom: TextAlign.center,
            ),
          ),
          ButtonCircularMain(
            onPressed: () => onPressedIncrease(),
            iconColor: context.colorPalette.text,
            buttonColor: context.colorPalette.cardBackground,
            icon: CupertinoIcons.add,
            buttonSize: 75,
            iconSize: 45,
            useShadow: false,
          ),
        ],
      ),
    );
  }
}
