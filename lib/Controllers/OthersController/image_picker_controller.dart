import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerMethods {
  File? fileImage;
  Future<File?> getImage(ImageSource imageType) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: imageType);
      if (pickedFile != null) {
        var image = File(pickedFile.path);
        fileImage = File(pickedFile.path);
        return image;
      }
    } catch (e) {
      // print(e.toString());
    }
  }
}
