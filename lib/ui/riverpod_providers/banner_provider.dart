import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/business/abstract_classes/i_collection_repository.dart';
import 'package:ecommerce_shopping_project/models/banner.dart' as model;
import 'package:ecommerce_shopping_project/models/collection.dart';
import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';
import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/collections_provider.dart';

final bannerProvider =
    AsyncNotifierProvider<BannerNotifier, List<model.Banner>>(
        () => BannerNotifier());

class BannerNotifier extends AsyncNotifier<List<model.Banner>> {
  @override
  FutureOr<List<model.Banner>> build() async {
    getAllBanners();
    return await future;
  }

  final _collectionManager = locator<ICollectionRepository>();

  getAllBanners() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return await _collectionManager.getAllBanners();
    });
  }

  navigate({required BuildContext context, required int index}) async {
    if (state.value != null && state.value?[index].collection != null) {
      var collectionEnum =
          ref.watch(getCollectionEnum(state.value![index].collection!));
      Collection collection = ref.watch(getCollection(collectionEnum));
      context.push(Routes.collectionDetails, extra: collection);
    } else if (state.value != null && state.value?[index].productId != null) {
      Product product = await _collectionManager.getProductById(
          productId: state.value![index].productId!);
      // ignore: use_build_context_synchronously
      context.push(Routes.productDetails, extra: product);
    } else {}
  }
}
