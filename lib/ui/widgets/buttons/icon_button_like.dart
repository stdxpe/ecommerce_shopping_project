import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/buttons/icon_button_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class IconButtonLike extends StatefulWidget {
  const IconButtonLike({
    super.key,
    required this.onPressed,
  });

  final Function onPressed;

  @override
  State<IconButtonLike> createState() => _IconButtonLikeState();
}

class _IconButtonLikeState extends State<IconButtonLike> {
  /// TODO: Lottie Like animation here
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return IconButtonMain(
      onPressed: () {
        widget.onPressed();
        setState(() {
          isLiked = !isLiked;
        });
      },
      icon: (isLiked)
          ? Icon(Icons.favorite, size: 75.h)
          : Icon(Icons.favorite_border, size: 75.h),
      foregroundColor: ColorPalette.favoriteRed,
    );
  }
}
