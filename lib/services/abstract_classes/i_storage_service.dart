import 'dart:io';

abstract class IStorageService {
  Future<String> getImageUrl({required String imageRelativePath});
  Future<String> uploadImage({required File file, required String path});
  Future<File?> selectImageFromGallery();
}
