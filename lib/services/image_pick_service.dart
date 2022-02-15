import 'dart:io';
import 'package:image_picker/image_picker.dart';

ImagePicker imagePicker = ImagePicker();
List<XFile> imageList = [];

void choose() async {
  bool haveImg = false;
  XFile file;
  var futureImg;
  file = (await imagePicker.pickImage(
    source: ImageSource.gallery,
  ))!;
  if (file != null) {
    haveImg = true;
    imageList.add(file);
    print(imageList);
  }
}
