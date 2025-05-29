import 'package:flutter/material.dart';

import 'package:ecommerce_shopping_project/ui/widgets/buttons/icon_button_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class IconButtonLike extends StatelessWidget {
  const IconButtonLike(
      {super.key, required this.onPressed, required this.isProductOnWishlist});

  final Function onPressed;
  final bool isProductOnWishlist;

  @override
  Widget build(BuildContext context) {
    return IconButtonMain(
      height: 150,
      onPressed: () => onPressed(),
      icon: (isProductOnWishlist) ? Icons.favorite : Icons.favorite_border,
      foregroundColor: ColorPalette.favoriteRed,
    );
  }
}
