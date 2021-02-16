import 'dart:io';

abstract class IStorageProvider {
  void uploadImage(String fileName, File _imageFile);
}
