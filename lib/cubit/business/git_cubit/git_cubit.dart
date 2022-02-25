import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/services/git_service.dart';

part 'git_state.dart';

class GitCubit extends Cubit<GitState> {
  GitCubit() : super(GitInitial());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _aboutUzController = TextEditingController();
  final TextEditingController _aboutEnController = TextEditingController();
  final TextEditingController _aboutRuController = TextEditingController();
  List<String> _languages = [];
  String _image = '';

  String _city = 'Tashkent';

  bool _hasEng = false;
  bool _hasUzb = false;
  bool _hasRus = false;
  bool _hasKaz = false;

  void onEngPressed(bool? value) {
    _hasEng = value!;
    emit(GitInitial());
  }

  void onRusPressed(bool? value) {
    _hasRus = value!;
    emit(GitInitial());
  }

  void onUzbPressed(bool? value) {
    _hasUzb = value!;
    emit(GitInitial());
  }

  void onKazPressed(bool? value) {
    _hasKaz = value!;
    emit(GitInitial());
  }

  void cityChanged(dynamic value) {
    _city = value;
    emit(GitInitial());
  }

  void onChooseImage() {
    ImageChooser chooser = ImageChooser();
    chooser.notStatic().then((value) {
      _image = ImageChooser.imageList[0];
      emit(GitInitial());
    });
  }

  void onDropdownMenuItemPressed() {}

  void onSavePressed() {
    if (_formKey.currentState!.validate()) {
      String phone = _phoneController.text.trim();
      String aboutUz = _aboutUzController.text.trim();
      String aboutEn = _aboutEnController.text.trim();
      String aboutRu = _aboutRuController.text.trim();
      String price = _priceController.text.trim();

      if (_hasEng) {
        _languages.add('Eng');
      }

      if (_hasUzb) {
        _languages.add('Uzb');
      }

      if (_hasRus) {
        _languages.add('Rus');
      }

      if (_hasKaz) {
        _languages.add('Uzb');
      }

      if(_image.isEmpty) {
        if (ImageChooser.imageList.isNotEmpty) {
          _image = ImageChooser.imageList[0];
        } else {
          Fluttertoast.showToast(msg: 'Please, set an image');
          return;
        }
      }

      Git git = Git(
        city: _city.toLowerCase(),
        informEn: aboutEn,
        informUz: aboutUz,
        informRu: aboutRu,
        tell: [phone],
        price: price,
        languages: _languages,
        image: _image,
      );
      GitService.createNewGit(git).then((value) {
        ImageChooser.clearImageList();
        CustomNavigator().pushAndRemoveUntil(const HomeScreen());
      });
    }
  }

  TextEditingController get phoneController => _phoneController;

  TextEditingController get priceController => _priceController;

  TextEditingController get aboutUzController => _aboutUzController;

  TextEditingController get aboutEnController => _aboutEnController;

  TextEditingController get aboutRuController => _aboutRuController;

  GlobalKey<FormState> get formKey => _formKey;

  List<String> get languages => _languages;

  bool get hasEng => _hasEng;

  bool get hasUzb => _hasUzb;

  bool get hasRus => _hasRus;

  bool get hasKaz => _hasKaz;

  String get city => _city;
}
