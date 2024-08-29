import 'package:firebase_storage/firebase_storage.dart';

import 'package:ecommerce_shopping_project/services/abstract_classes/i_storage_service.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';

class FirebaseStorageService extends IStorageService {
  final _storage = locator<FirebaseStorage>();

  @override
  Future<String> getImageUrl({required String imageRelativePath}) async {
    final storageRef = _storage.ref();
    final pathRef = storageRef.child(imageRelativePath);
    final downloadUrl = await pathRef.getDownloadURL();
    return downloadUrl;
  }
}
