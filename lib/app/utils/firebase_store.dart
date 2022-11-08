import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Storage {
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<String?> uploadImageAndGetDownloadUrl(
    File image,
  ) async {
    String? uploadedImageDownloadUrl;
    try {
      Reference ref =
          storage.ref('staff_image').child(image.path.split('/').last);
      final uploadTask = ref.putFile(image);

      uploadedImageDownloadUrl =
          (await (await uploadTask).ref.getDownloadURL()).toString();
    } on FirebaseException catch (e) {
      debugPrint(e.message);
    }
    return uploadedImageDownloadUrl;
  }
}
