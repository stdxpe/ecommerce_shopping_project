import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorPalette.scaffoldBackground,
      body: Center(
        child: LoadingAnimationWidget.fourRotatingDots(
            color: ColorPalette.favoriteRed, size: 50),
      ),
    );
  }
}
