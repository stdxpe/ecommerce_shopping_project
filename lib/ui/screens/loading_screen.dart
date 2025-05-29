import 'package:flutter/material.dart';

import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorPalette.scaffoldBackground,
      body: Center(
        child: Lottie.asset(
          AppImages.lottieLoading,
          height: context.mediaQuery.size.width * 0.7,
          width: context.mediaQuery.size.width * 0.7,
        ),
      ),
    );
  }
}
