import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final colorIndexProvider = StateNotifierProvider<ColorNotifier, Color>((ref) {
  return ColorNotifier();
});

class ColorNotifier extends StateNotifier<Color> {
  ColorNotifier() : super(const Color(0xFFBC5A22));
  List rawColorsList = [
    const Color(0xFFBC5A22),
    const Color(0xFF3A8F07),
    const Color(0xFF6B1B9C),
    const Color(0xFF1A949C),
    const Color(0xFF073C96),
  ];
  late Color selectedColor;
  changeColor(int index) {
    state = rawColorsList[index];
  }

  bool isAnimationStarted({bool? result}) {
    state = state;

    return result ?? false;
  }

  returnWidget() {
    Color rawColor = state;
    HSLColor color = HSLColor.fromColor(rawColor);
    return Container(
      height: 1.sh,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withLightness(color.lightness * 0.1).toColor(),
            color.withLightness(color.lightness * 0.3).toColor(),
            color.toColor(),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    ).animate(autoPlay: true).fadeIn(duration: 1000.ms);
  }
}
