import 'package:flutter/material.dart';
import 'package:rating_summary/rating_summary.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

// https://pub.dev/packages/rating_summary
  @override
  Widget build(BuildContext context) {
    return RatingSummary(
      counter: 13,
      average: 3.846,
      showAverage: true,
      counterFiveStars: 5,
      counterFourStars: 4,
      counterThreeStars: 2,
      counterTwoStars: 1,
      counterOneStars: 1,
    );
  }
}
