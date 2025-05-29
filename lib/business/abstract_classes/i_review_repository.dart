import 'package:ecommerce_shopping_project/models/review.dart';

abstract class IReviewRepository {
  Future<List<Review>> getProductReviews({required String productId});
}
