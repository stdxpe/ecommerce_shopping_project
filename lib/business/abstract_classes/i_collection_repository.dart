import 'package:ecommerce_shopping_project/models/collection.dart';

abstract class ICollectionRepository {
  Future<Collection> getCollectionById({required String collectionId});
  Future<void> createCollection({required Collection collection});

// TODO: Personal Collections, 'Recommended For You' Section to-be-created
// Depends on the Liked, Ordered or Searched Collections/Products
}
