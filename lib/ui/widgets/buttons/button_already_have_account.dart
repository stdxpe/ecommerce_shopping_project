import 'package:flutter/material.dart';

import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ButtonAlreadyHaveAccount extends StatelessWidget {
  const ButtonAlreadyHaveAccount({
    super.key,
    required this.onPressed,
    this.textStatic,
    required this.buttonText,
    this.textStaticColor,
    this.buttonTextColor,
    this.fontSize,
  });
  final Function onPressed;
  final String? textStatic;
  final String buttonText;
  final Color? textStaticColor;
  final Color? buttonTextColor;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextCustom(
              text: textStatic ?? '',
              textStyle: context.textTheme.titleMedium!,
              color: textStaticColor?.withOpacity(0.75) ??
                  context.colorPalette.title.withOpacity(0.75),
              fontSizeCustom: fontSize,
              fontWeightCustom: FontWeight.w500,
              textAlignCustom: TextAlign.center,
            ),
            TextCustom(
              text: buttonText,
              textStyle: context.textTheme.titleMedium!,
              color: buttonTextColor ?? context.colorPalette.title,
              fontSizeCustom: fontSize,
              fontWeightCustom: FontWeight.w700,
              textAlignCustom: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
