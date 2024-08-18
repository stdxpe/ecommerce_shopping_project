import 'package:ecommerce_shopping_project/models/collection.dart';

abstract class ICollectionService {
  Future<Collection?> getCollectionById({required String collectionId});
  Future<void> createCollection({required Collection collection});
  Future<void> updateCollection({required Collection collection});
  Future<void> deleteCollection({required String collectionId});
}
