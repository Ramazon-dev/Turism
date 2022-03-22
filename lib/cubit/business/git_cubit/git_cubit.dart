import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

part 'git_state.dart';

class GitCubit extends Cubit<GitState> {
  GitCubit() : super(GitInitial());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _aboutUzController = TextEditingController();
  final TextEditingController _aboutEnController = TextEditingController();
  final TextEditingController _aboutRuController = TextEditingController();
  final Set<String> _languages = {};
  String _image = '';
  static final Git? _git = GetStorage().read('git');
  //String image = _git != null ? _git!.image : '';

  void readImage() => print(_git);

  String _city = CityList.cities[0].name;
  String _chosenCity = CityList().getCity(CityList.cities[0].name);

  bool _hasEng = false;
  bool _hasUzb = false;
  bool _hasRus = false;
  bool _hasKaz = false;

  bool _isEditing = false;
  String _gitId = '';

  GitCubit.editing(Git git) : super(GitInitial()) {
    _isEditing = true;
    _gitId = git.id!;
    _phoneController.text = git.tell![0];
    _priceController.text = git.price!;
    _aboutUzController.text = git.informUz!;
    _aboutEnController.text = git.informEn!;
    _aboutRuController.text = git.informRu!;
    git.languages!.map((e) => _languages.add(e));
    _image = git.image!;
    _city = CityList().getCityName(git.city!);
    for (var lang in git.languages!) {
      if (lang == 'uz') {
        _hasUzb = true;
      }
      if (lang == 'en') {
        _hasEng = true;
      }
      if (lang == 'kz') {
        _hasKaz = true;
      }
      if (lang == 'ru') {
        _hasRus = true;
      }
    }
  }

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
    _chosenCity = CityList().getCity(_city);
    emit(GitInitial());
  }

  void onChooseImage() {
    ImageChooser chooser = ImageChooser();
    chooser.notStatic().then((value) {
      _image = ImageChooser.imageList[0];
      emit(GitInitial());
    });
  }

  void onChooseImageV2() {
    //TODO:

    print('pressed');
    ImageChooser.chooseOneImage().then((value) {
      print("GIT NEW IMAGE: " + value);
      var git = GetStorage().read('git');
      print("GIT ID: " + git.toString());
      String? gitId = git.id;
      if (gitId != null) {
        GitService.updateGitImage(gitId: gitId, gitImage: value);
      }
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
        _languages.add('en');
      }

      if (_hasUzb) {
        _languages.add('uz');
      }

      if (_hasRus) {
        _languages.add('ru');
      }

      if (_hasKaz) {
        _languages.add('kz');
      }

      if (_image.isEmpty) {
        if (ImageChooser.imageList.isNotEmpty) {
          _image = ImageChooser.imageList[0];
        } else {
          Fluttertoast.showToast(msg: 'Please, set an image');
          return;
        }
      }
      Git git = Git(
        id: _gitId.isNotEmpty ? _gitId : null,
        city: _chosenCity.toLowerCase(),
        informEn: aboutEn,
        informUz: aboutUz,
        informRu: aboutRu,
        tell: [phone],
        price: price,
        languages: _languages.toList(),
        image: _image,
      );

      if (_isEditing) {
        // If git is updating
        GitService.updateGitData(git).then((value) {
          Fluttertoast.showToast(msg: 'Updated');
          CustomNavigator().pushAndRemoveUntil(const HomeScreen());
        });
      } else {
        GitService.createNewGit(git).then((value) {
          ImageChooser.clearImageList();
          CustomNavigator().pushAndRemoveUntil(const HomeScreen());
        });
      }
    }
  }

  TextEditingController get phoneController => _phoneController;

  TextEditingController get priceController => _priceController;

  TextEditingController get aboutUzController => _aboutUzController;

  TextEditingController get aboutEnController => _aboutEnController;

  TextEditingController get aboutRuController => _aboutRuController;

  GlobalKey<FormState> get formKey => _formKey;

  List<String> get languages => _languages.toList();

  bool get hasEng => _hasEng;

  bool get hasUzb => _hasUzb;

  bool get hasRus => _hasRus;

  bool get hasKaz => _hasKaz;

  String get city => _city;
}
