import 'package:image_picker/image_picker.dart';

class ImageChooser {
  static ImagePicker imagePicker = ImagePicker();
  static List<String> imageList = [];
  static PickedFile image = PickedFile('path');

  static Future chooseImage() async {
    XFile file;

    file = (await imagePicker.pickImage(
      source: ImageSource.gallery,
    ))!;

    imageList.add(file.path);
    image = PickedFile(file.path);
    print('image: ' + image.path);
    imageList.forEach((element) => print(element));
  }

  static chooseOneImage() async {
    XFile file;
    file = (await imagePicker.pickImage(
      source: ImageSource.gallery,
    ))!;
    return file.path;
  }

  static void clearImageList() {
    imageList.clear();
  }

  Future notStatic() async {
    XFile file;
    file = (await imagePicker.pickImage(
      source: ImageSource.gallery,
    ))!;

    imageList.add(file.path);
    imageList.forEach((element) => print(element));
  }
}
