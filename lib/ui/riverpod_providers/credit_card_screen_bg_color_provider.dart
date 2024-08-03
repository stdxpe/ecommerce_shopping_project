import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final coloredBgIndexProvider = StateProvider<int>((ref) {
  return 0;
});

final colorProvider = StateProvider<Color>((ref) {
  int colorIndex = ref.watch(coloredBgIndexProvider);

  List rawColorsList = [
    const Color(0xFFBC5A22),
    const Color(0xFF3A8F07),
    const Color(0xFF6B1B9C),
    const Color(0xFF1A949C),
    const Color(0xFF073C96),
  ];
  return rawColorsList[colorIndex];
});

final coloredBgProvider = StateProvider<Widget>((ref) {
  int colorIndex = ref.watch(coloredBgIndexProvider);

  List rawColorsList = [
    const Color(0xFFBC5A22),
    const Color(0xFF3A8F07),
    const Color(0xFF6B1B9C),
    const Color(0xFF1A949C),
    const Color(0xFF073C96),
  ];
  return Container(color: rawColorsList[colorIndex])
      .animate(
          // target: setState ? 1 : 0,
          )
      .fade(duration: 1000.ms);
});

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
