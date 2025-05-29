import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/business/abstract_classes/i_review_repository.dart';
import 'package:ecommerce_shopping_project/models/review.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';

final reviewsProvider =
    AsyncNotifierProviderFamily<ReviewsNotifier, List<Review>, String>(
        ReviewsNotifier.new);

class ReviewsNotifier extends FamilyAsyncNotifier<List<Review>, String> {
  @override
  FutureOr<List<Review>> build(String arg) async {
    /// Initial State Setup Operation
    getProductReviews(productId: arg);

    /// Waiting for the inner method to be completed
    return await future;
  }

  final _reviewManager = locator<IReviewRepository>();

  getProductReviews({required String productId}) async {
    debugPrint('ReviewsNotifier | getProductReviews() Executed');

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async => await _reviewManager.getProductReviews(productId: productId),
    );
  }
}

typedef ReviewSummaryOutputs = ({
  int ratingCountStar4_5,
  int ratingCountStar3_4,
  int ratingCountStar2_3,
  int ratingCountStar1_2,
  int ratingCountStar0_1,
  int totalRatingCount,
});

final reviewSummaryProvider =
    Provider.family<ReviewSummaryOutputs, List<Review>>((ref, reviewList) {
  List<double> listRatingCountStar4_5 = [];
  List<double> listRatingCountStar3_4 = [];
  List<double> listRatingCountStar2_3 = [];
  List<double> listRatingCountStar1_2 = [];
  List<double> listRatingCountStar0_1 = [];

  for (var review in reviewList) {
    double rating = review.productRating;

    if (rating >= 4 && rating <= 5) {
      listRatingCountStar4_5.add(rating);
    } else if (rating >= 3 && rating <= 4) {
      listRatingCountStar3_4.add(rating);
    } else if (rating >= 2 && rating <= 3) {
      listRatingCountStar2_3.add(rating);
    } else if (rating >= 1 && rating <= 2) {
      listRatingCountStar1_2.add(rating);
    } else if (rating >= 0 && rating <= 1) {
      listRatingCountStar0_1.add(rating);
    } else {
      listRatingCountStar0_1.add(rating);
    }
  }

  return (
    ratingCountStar4_5: listRatingCountStar4_5.length,
    ratingCountStar3_4: listRatingCountStar3_4.length,
    ratingCountStar2_3: listRatingCountStar2_3.length,
    ratingCountStar1_2: listRatingCountStar1_2.length,
    ratingCountStar0_1: listRatingCountStar0_1.length,
    totalRatingCount: reviewList.length
  );
});
