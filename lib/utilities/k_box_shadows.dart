part of 'utilities_library_imports.dart';

abstract class BoxShadows {
  /// [APP WIDE GLOBAL VARIABLE]
  /// RETURNS BOX SHADOWS (ALSO TAKES COLOR PARAMETER AS INPUT)

  static BoxShadow kBoxShadowTopBanner({required Color color}) {
    return BoxShadow(
      color: color,
      offset: const Offset(0, 0),
      spreadRadius: 0,
      blurRadius: 10,
    );
  }

  static BoxShadow kBoxShadowBottomSheet({required Color color}) {
    return BoxShadow(
      color: color,
      offset: const Offset(0, 0),
      spreadRadius: 0.5,
      blurRadius: 10,
    );
  }

  static BoxShadow kBoxShadowProductCard({required Color color}) {
    return BoxShadow(
      color: color,
      offset: const Offset(0, 3),
      spreadRadius: 0.1,
      blurRadius: 5,
    );
  }

  static BoxShadow kBoxShadowPrimary({required Color color}) {
    return BoxShadow(
      color: color,
      offset: const Offset(0, 3),
      spreadRadius: 0.1,
      blurRadius: 12.5,
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

  static BoxShadow kBoxShadowButton({required Color color}) {
    return BoxShadow(
      color: color,
      offset: const Offset(0, 8),
      spreadRadius: 0.1,
      blurRadius: 25,
    );
  }

  static BoxShadow kBoxShadowOnboardingCard({required Color color}) {
    return BoxShadow(
      color: color,
      offset: const Offset(0, 15),
      spreadRadius: 0,
      blurRadius: 20,
    );
  }

  static BoxShadow kBoxShadowTitle({required Color color}) {
    return BoxShadow(
      color: color,
      offset: const Offset(0, 3),
      spreadRadius: 10,
      blurRadius: 2,
    );
  }

  static BoxShadow kBoxShadowText({required Color color}) {
    return BoxShadow(
      color: color,
      offset: const Offset(0, 2),
      spreadRadius: 5,
      blurRadius: 2,
    );
  }

  static BoxShadow kBoxShadowProductCardText({required Color color}) {
    return BoxShadow(
      color: color,
      offset: const Offset(0, 0.5),
      spreadRadius: 0,
      blurRadius: 0,
    );
  }

  static BoxShadow kBoxShadowImage({required Color color}) {
    return BoxShadow(
      color: color,
      offset: const Offset(0, 2),
      spreadRadius: 0,
      blurRadius: 1.5,
    );
  }
}
