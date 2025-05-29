import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwitchRatingStars extends StatelessWidget {
  final double rating;
  final double? starSize;
  final double? starPadding;
  final Color? ratedStarColor;
  final Color? unratedStarColor;

  const SwitchRatingStars({
    required this.rating,
    this.starSize,
    this.ratedStarColor,
    this.unratedStarColor,
    this.starPadding = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: rating,
      minRating: 0.5,
      itemSize: starSize ?? 60.h,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      glowColor: Colors.red,
      unratedColor: unratedStarColor ?? ColorPalette.unratedStarColor,
      ignoreGestures: true,
      itemPadding: EdgeInsets.symmetric(horizontal: starPadding!),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: ratedStarColor ?? ColorPalette.ratedStarColor,
      ),
      onRatingUpdate: (value) {},
    );
  }
}
