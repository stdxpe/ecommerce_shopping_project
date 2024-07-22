import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class TitleProductDetail extends StatelessWidget {
  const TitleProductDetail({
    super.key,
    required this.title,
    required this.price,
    this.droppedPrice,
  });

  final String title;
  final double price;
  final double? droppedPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 4,
          child: TextCustom(
            text: title,
            textStyle: context.textTheme.displayLarge!,
            color: context.colorPalette.text,
            maxLines: 2,
            isHeightConstraintRelated: false,
          ),
        ),
        Flexible(flex: 1, child: SizedBox(width: 10.w)),
        Flexible(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (droppedPrice != null)
                TextCustom(
                  text: '\$${droppedPrice!.toStringAsFixed(2)}',
                  textStyle: context.textTheme.displayLarge!,
                  color: context.colorPalette.textFaded,
                  fontSizeCustom: 46,
                  isLineThrough: true,
                  fontHeightCustom: 1.4,
                ),
              TextCustom(
                text: '\$${price.toStringAsFixed(2)}',
                textStyle: context.textTheme.displayLarge!,
                color: context.colorPalette.text,
                fontSizeCustom: 60,
                // fontHeightCustom: 1.5,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
