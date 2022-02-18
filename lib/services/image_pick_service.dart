import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImageChooser {
  static ImagePicker imagePicker = ImagePicker();
  static List<String> imageList = [];

  static void chooseImage() async {
    XFile file;
    file = (await imagePicker.pickImage(
      source: ImageSource.gallery,
    ))!;

    imageList.add(file.path);
    imageList.forEach((element) => print(element));
  }

  static void clearImageList() {
    imageList.clear();
  }
}
