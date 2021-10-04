import 'dart:io';

import 'package:image_picker/image_picker.dart';

class Utils {
  static Future<File?> imageToFile() async {
    try {
      final ImagePicker _picker = ImagePicker();
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      File imageFile = File(image!.path);
      return imageFile;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
