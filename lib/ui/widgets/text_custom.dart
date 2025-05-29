import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextCustom extends StatelessWidget {
  const TextCustom({
    super.key,
    required this.text,
    required this.color,
    required this.textStyle,
    this.fontSizeCustom,
    this.fontHeightCustom,
    this.fontWeightCustom,
    this.fontLetterSpacingCustom,
    this.maxLines = 1,
    this.textAlignCustom = TextAlign.start,
    this.boxShadowsCustom,
    this.foregroundPaintCustom,
    this.isHeightConstraintRelated = true,
    this.isLineThrough = false,
  });

  final String text;
  final Color color;
  final TextStyle textStyle;
  final double? fontSizeCustom;
  final double? fontHeightCustom;
  final FontWeight? fontWeightCustom;
  final double? fontLetterSpacingCustom;
  final int? maxLines;
  final TextAlign? textAlignCustom;
  final List<BoxShadow>? boxShadowsCustom;
  final Paint? foregroundPaintCustom;
  final bool? isHeightConstraintRelated;
  final bool? isLineThrough;

  @override
  Widget build(BuildContext context) {
    var fontSizeFinal = fontSizeCustom ?? textStyle.fontSize;
    var textHeightFinal = fontHeightCustom ?? textStyle.height;
    return Container(
      // color: Colors.yellow,
      padding: EdgeInsets.zero,
      height: (isHeightConstraintRelated == true)
          ? fontSizeFinal!.h * textHeightFinal! * maxLines!
          : null,
      child: Text(
        text,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlignCustom,
        textScaler: TextScaler.noScaling,
        style: textStyle.copyWith(
          decoration: isLineThrough! ? TextDecoration.lineThrough : null,
          color: (foregroundPaintCustom != null) ? null : color,
          fontSize: fontSizeFinal!.h,
          height: fontHeightCustom,
          fontWeight: fontWeightCustom ?? textStyle.fontWeight,
          letterSpacing: fontLetterSpacingCustom ?? textStyle.letterSpacing,
          shadows: [
            if (boxShadowsCustom != null) ...boxShadowsCustom!,
          ],
          foreground: foregroundPaintCustom,
        ),
      ),
    );
  }
}
