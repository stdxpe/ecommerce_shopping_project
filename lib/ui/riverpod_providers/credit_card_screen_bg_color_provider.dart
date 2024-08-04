import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final creditCardBgColorProvider =
    StateNotifierProvider<CreditCardBgColorNotifier, HSLColor>((ref) {
  return CreditCardBgColorNotifier();
});

class CreditCardBgColorNotifier extends StateNotifier<HSLColor> {
  CreditCardBgColorNotifier()
      : super(HSLColor.fromColor(const Color(0xFFBC5A22)));

  List rawColorsList = [
    const Color(0xFFBC5A22),
    const Color(0xFF3A8F07),
    const Color(0xFF6B1B9C),
    const Color(0xFF1A949C),
    const Color(0xFF073C96),
  ];
  setColorIndex(int index) {
    Color rawColor = rawColorsList[index];
    HSLColor hslColor = HSLColor.fromColor(rawColor);
    state = hslColor;
  }
}
