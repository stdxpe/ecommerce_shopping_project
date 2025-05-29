import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/business/abstract_classes/i_collection_repository.dart';
import 'package:ecommerce_shopping_project/models/deal.dart';
import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';
import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';

final dealsProvider =
    AsyncNotifierProvider<BannerNotifier, List<Deal>>(() => BannerNotifier());

class BannerNotifier extends AsyncNotifier<List<Deal>> {
  @override
  FutureOr<List<Deal>> build() async {
    getAllDeals();
    return await future;
  }

  final _collectionManager = locator<ICollectionRepository>();

  getAllDeals() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return await _collectionManager.getAllDeals();
    });
  }

  navigate({required BuildContext context, required int index}) async {
    if (state.value != null && state.value?[index].productId != null) {
      Product product = await _collectionManager.getProductById(
          productId: state.value![index].productId!);
      // ignore: use_build_context_synchronously
      context.push(Routes.productDetails, extra: product);
    } else {}
  }
}

/// TODO: popupProvider - Seasonal Campaigns
/// TODO: NEW DEALS : Works for loading states too

final popupProvider = Provider<void>((ref) async {
  await Future.delayed(const Duration(milliseconds: 2000));
  ref.watch(goRouterProvider).push(Routes.dialogError);
  // onTap: () => context.push(Routes.dialogNewDeals,
  //         extra: dummyCollections[2]),
});
