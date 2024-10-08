import 'package:flutter/material.dart';

import 'package:ecommerce_shopping_project/business/abstract_classes/i_collection_repository.dart';
import 'package:ecommerce_shopping_project/models/banner.dart' as model;
import 'package:ecommerce_shopping_project/models/collection.dart';
import 'package:ecommerce_shopping_project/models/collection_dto.dart';
import 'package:ecommerce_shopping_project/models/deal.dart';
import 'package:ecommerce_shopping_project/models/filter.dart';
import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/services/abstract_classes/i_collection_service.dart';
import 'package:ecommerce_shopping_project/services/abstract_classes/i_product_service.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';

class CollectionManager extends ICollectionRepository {
  final _productService = locator<IProductService>();
  final _collectionService = locator<ICollectionService>();

  @override
  Future<List<Collection>> getAllCollections() async {
    try {
      List<Collection> tempCollectionList = [];

      List<CollectionDto> tempCollectionDtoList =
          await _collectionService.getAllCollections();

      for (var collectionDto in tempCollectionDtoList) {
        /// Converting List<String> productId's, into List<Product> to work with
        List<Product> tempProductList = [];

        /// TODO: Change into All Products (removed due to Firebase Costs)
        for (String productId in collectionDto.products) {
          Product? selectedProduct =
              await _productService.getProductById(productId: productId);
          if (selectedProduct != null) tempProductList.add(selectedProduct);
        }
        // for (int i = 0; i <= 2; i++) {
        //   String tempProductId = collectionDto.products[i];
        //   Product? selectedProduct =
        //       await _productService.getProductById(productId: tempProductId);
        //   if (selectedProduct != null) tempProductList.add(selectedProduct);
        // }

        /// TODO: END Change into All Products (removed due to Firebase Costs)

        /// Creating a new Collection model from CollectionDto model, with new params
        Collection tempCollection = Collection(
          id: collectionDto.id,
          title: collectionDto.title,
          subtitle: collectionDto.subtitle,
          photo: collectionDto.photo,
          products: tempProductList,
        );

        tempCollectionList.add(tempCollection);
      }
      return tempCollectionList;
    } on Exception catch (_) {
      print(
          'CollectionManager getAllCollections catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      print(
          'CollectionManager getAllCollections catch error block exec, rethrowing');
      rethrow;
    }
  }

  @override
  Future<Collection> getCollectionById({required String collectionId}) async {
    try {
      print('CollectionManager getCollectionById try block exec');

      CollectionDto? collectionDto = await _collectionService.getCollectionById(
          collectionId: collectionId);

      if (collectionDto != null) {
        print('CollectionManager getCollectionById if block exec');

        List<Product> tempProductList = [];

        for (String productId in collectionDto.products) {
          Product? selectedProduct =
              await _productService.getProductById(productId: productId);
          if (selectedProduct != null) tempProductList.add(selectedProduct);
        }

        Collection collection = Collection(
          id: collectionDto.id,
          title: collectionDto.title,
          subtitle: collectionDto.subtitle,
          photo: collectionDto.photo,
          products: tempProductList,
        );
        return collection;
      } else {
        print(
            'CollectionManager getCollectionById else block exec. Collection is Null. throwing Exception');
        throw Exception();
      }
    } on Exception catch (_) {
      print(
          'CollectionManager getCollectionById catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      print(
          'CollectionManager getCollectionById catch error block exec, rethrowing');
      rethrow;
    }
  }

  @override
  Future<void> createCollection({required Collection collection}) async {
    try {
      print('CollectionManager createCollection try block exec');
      CollectionDto collectionDto = CollectionDto(
        id: collection.id,
        title: collection.title,
        subtitle: collection.subtitle,
        photo: collection.photo,
        products: collection.products.map((product) => product.id).toList(),
      );

      await _collectionService.createCollection(collectionDto: collectionDto);
    } on Exception catch (_) {
      print(
          'CollectionManager createCollection catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      print(
          'CollectionManager createCollection catch error block exec, rethrowing');
      rethrow;
    }
  }

  @override
  Future<List<Product>> getCollectionByFilter({required Filter filter}) async {
    try {
      return await _productService.getProductsByFilter(filter: filter);
    } on Exception catch (_) {
      print(
          'CollectionManager getCollectionByFilter catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      print(
          'CollectionManager getCollectionByFilter catch error block exec, rethrowing');
      rethrow;
    }
  }

  @override
  Future<List<model.Banner>> getAllBanners() async {
    try {
      debugPrint(
          'CollectionManager getAllBanners try exception block exec, rethrowing');

      List<model.Banner> tempBannersList = [];
      tempBannersList = await _collectionService.getAllBanners();
      return tempBannersList;
    } on Exception catch (_) {
      print(
          'CollectionManager getAllBanners catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      print(
          'CollectionManager getAllBanners catch error block exec, rethrowing');
      rethrow;
    }
  }

  @override
  Future<List<Deal>> getAllDeals() async {
    try {
      debugPrint(
          'CollectionManager getAllDeals try exception block exec, rethrowing');

      List<Deal> tempDealsList = [];
      tempDealsList = await _collectionService.getAllDeals();
      return tempDealsList;
    } on Exception catch (_) {
      print(
          'CollectionManager getAllDeals catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      print('CollectionManager getAllDeals catch error block exec, rethrowing');
      rethrow;
    }
  }

  @override
  Future<Product> getProductById({required String productId}) async {
    try {
      print('CollectionManager getProductById try block exec');

      Product? selectedProduct =
          await _productService.getProductById(productId: productId);

      if (selectedProduct != null) {
        print('CollectionManager getProductById if block exec');

        return selectedProduct;
      } else {
        print(
            'CollectionManager getProductById else block exec. Collection is Null. throwing Exception');
        throw Exception();
      }
    } on Exception catch (_) {
      print(
          'CollectionManager getProductById catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      print(
          'CollectionManager getProductById catch error block exec, rethrowing');
      rethrow;
    }
  }
}
