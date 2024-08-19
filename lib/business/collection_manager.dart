import 'package:ecommerce_shopping_project/models/collection.dart';
import 'package:ecommerce_shopping_project/business/abstract_classes/i_collection_repository.dart';
import 'package:ecommerce_shopping_project/services/abstract_classes/i_collection_service.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';

class CollectionManager extends ICollectionRepository {
  final _collectionService = locator<ICollectionService>();

  @override
  Future<Collection> getCollectionById({required String collectionId}) async {
    try {
      print('CollectionManager getCollectionById try block exec');

      Collection? collection = await _collectionService.getCollectionById(
          collectionId: collectionId);

      return (collection != null) ? collection : throw Exception();
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
      await _collectionService.createCollection(collection: collection);
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
}
