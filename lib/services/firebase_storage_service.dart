import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

import 'package:ecommerce_shopping_project/services/abstract_classes/i_storage_service.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';
import 'package:image_picker/image_picker.dart';

class FirebaseStorageService extends IStorageService {
  final _storage = locator<FirebaseStorage>();

  @override
  Future<String> getImageUrl({required String imageRelativePath}) async {
    final storageRef = _storage.ref();
    final pathRef = storageRef.child(imageRelativePath);
    final downloadUrl = await pathRef.getDownloadURL();
    return downloadUrl;
  }

  @override
  Future<String> uploadImage({required File file, required String path}) async {
    String filePath = '$path.jpg';
    final storageRef = _storage.ref(filePath);
    await storageRef.putFile(file);
    return filePath;
  }

  @override
  Future<File?> selectImageFromGallery() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 400,
      maxWidth: 400,
    );
    if (image != null) {
      return File(image.path);
    } else {
      return null;
    }
  }
}
