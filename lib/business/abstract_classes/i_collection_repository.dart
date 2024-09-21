import 'package:ecommerce_shopping_project/models/collection.dart';
import 'package:ecommerce_shopping_project/models/filter.dart';
import 'package:ecommerce_shopping_project/models/product.dart';

abstract class ICollectionRepository {
  Future<List<Collection>> getAllCollections();
  Future<Collection> getCollectionById({required String collectionId});
  Future<void> createCollection({required Collection collection});
  Future<List<Product>> getCollectionByFilter({required Filter filter});
}
