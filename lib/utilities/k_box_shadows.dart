import 'package:flutter/material.dart';

abstract class BoxShadows {
  /// [APP WIDE GLOBAL VARIABLE]
  /// RETURNS BOX SHADOWS (ALSO TAKES COLOR PARAMETER AS INPUT)

  static BoxShadow kBoxShadowPrimary({required Color color}) {
    return BoxShadow(
      color: color,
      offset: const Offset(0, 8),
      spreadRadius: 0.1,
      blurRadius: 25,
    );
  }

  static BoxShadow kBoxShadowSecondary({required Color color}) {
    return BoxShadow(
      color: color,
      offset: const Offset(0, 8),
      spreadRadius: 0.1,
      blurRadius: 25,
    );
  }

  static BoxShadow kBoxShadowTertiary({required Color color}) {
    return BoxShadow(
      color: color,
      offset: const Offset(0, 8),
      spreadRadius: 0.1,
      blurRadius: 25,
    );
  }
}
