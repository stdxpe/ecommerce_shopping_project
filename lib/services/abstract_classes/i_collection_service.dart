import 'package:ecommerce_shopping_project/models/collection_dto.dart';
import 'package:ecommerce_shopping_project/models/banner.dart';

abstract class ICollectionService {
  Future<List<CollectionDto>> getAllCollections();
  Future<CollectionDto?> getCollectionById({required String collectionId});
  Future<void> createCollection({required CollectionDto collectionDto});
  Future<List<Banner>> getAllBanners();
}
