import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_shopping_project/models/collection.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';
import 'package:ecommerce_shopping_project/services/abstract_classes/i_collection_service.dart';

class FirebaseCollectionService extends ICollectionService {
  final _db = locator<FirebaseFirestore>();

  @override
  Future<Collection?> getCollectionById({required String collectionId}) async {
    var returnedSnapshot = await _db.doc('collections/$collectionId').get();
    var returnedMap = returnedSnapshot.data();

    if (returnedSnapshot.exists &&
        returnedMap != null &&
        returnedMap.isNotEmpty) {
      print(
          'FirebaseCollectionService getCollectionById if block exec. Product is NOT null');

      Collection collection = Collection.fromMap(returnedMap);
      return collection;
    } else {
      print(
          'FirebaseCollectionService getCollectionById else block exec. Product is null');
      return null;
    }
  }
}
