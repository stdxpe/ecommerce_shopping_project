import 'package:flutter/material.dart';

import 'package:ecommerce_shopping_project/business/abstract_classes/i_review_repository.dart';
import 'package:ecommerce_shopping_project/models/review.dart';
import 'package:ecommerce_shopping_project/services/abstract_classes/i_product_service.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';

class ReviewManager extends IReviewRepository {
  final _productService = locator<IProductService>();

  @override
  Future<List<Review>> getProductReviews({required String productId}) async {
    try {
      debugPrint('ReviewManager getProductReviews try block exec');

      List<Review> tempReviewList =
          await _productService.getProductReviews(productId: productId);

      return tempReviewList;
    } on Exception catch (_) {
      debugPrint(
          'ReviewManager getProductReviews catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      debugPrint(
          'ReviewManager getProductReviews catch error block exec, rethrowing');
      rethrow;
    }
  }
}
