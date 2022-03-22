import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/models/category_model.dart';
import 'package:mobileapp/services/restaurant_service.dart';

part 'restaurant_state.dart';

class RestaurantCubit extends Cubit<RestorantState> {
  RestaurantCubit() : super(RestorantInitial());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();
  final TextEditingController _mapLinkController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _aboutUzController = TextEditingController();
  final TextEditingController _aboutEnController = TextEditingController();
  final TextEditingController _aboutRuController = TextEditingController();
  List<String> _imageList = [];

  String _city = CityList.cities[0].name;
  String _chosenCity = CityList().getCity(CityList.cities[0].value);

  late List<Category> categories = (GetStorage().read('restCategories') as List)
      .map((e) => Category.fromJson(e))
      .toList();

  late Category category = categories[0];

  bool _isEditing = false;
  late String _restaurantId;

  RestaurantCubit.editing(Restaurant rest) : super(RestorantInitial()) {
    _restaurantId = rest.id!;
    _isEditing = true;
    _nameController.text = rest.name!;
    _phoneController.text = rest.tell![0];
    _typeController.text = rest.categoryId!;
    _websiteController.text = rest.site.toString();
    _mapLinkController.text = rest.karta!;
    _aboutUzController.text = rest.informUz!;
    _aboutEnController.text = rest.informEn!;
    _aboutRuController.text = rest.informRu!;
    _imageList = rest.media!;
    _city = CityList().getCityName(rest.city!);
  }

  void cityChanged(dynamic value) {
    _city = value;
    _chosenCity = CityList().getCity(_city);
    emit(RestorantInitial());
  }

  void categoryChanged(dynamic value) {
    for (var ctgry in categories) {
      if (value == ctgry.nameUz) {
        category = ctgry;
      }
    }
    emit(RestorantInitial());
  }

  void setImage() {
    ImageChooser.chooseImage();
    _imageList = ImageChooser.imageList;
    print(_imageList);
    emit(RestorantInitial());
  }

  void onDropdownMenuItemPressed() {}

  void onSavePressed() {
    // Agar validate bo'lgan bo'lsa
    if (_formKey.currentState!.validate()) {
      print('validate save pressed in restaurant');
      String name = _nameController.text.trim();
      String phone = _phoneController.text.trim();
      String link = _websiteController.text.trim();
      String map = _mapLinkController.text.trim();
      String aboutUz = _aboutUzController.text.trim();
      String aboutEn = _aboutEnController.text.trim();
      String aboutRu = _aboutRuController.text.trim();
      String site = _websiteController.text.trim();

      Restaurant restaurant = Restaurant(
        name: name,
        media: ImageChooser.imageList,
        informUz: aboutUz,
        informEn: aboutEn,
        informRu: aboutRu,
        karta: map,
        city: _chosenCity.toLowerCase(),
        tell: [phone],
        categoryId: category.id,
        site: site
      );

      if (_isEditing) {
        // Update
        Fluttertoast.showToast(msg: 'Soon');
      } else {
        print(restaurant.toString());
        RestaurantService.createNewRestaurant(restaurant).then((value) {
          if (value == 201) {
            Fluttertoast.showToast(msg: 'Successful');
            ImageChooser.clearImageList();
            CustomNavigator().pushAndRemoveUntil(const HomeScreen());
          } else {
            Fluttertoast.showToast(msg: value.toString());
          }
        });
      }
    }
  }

  TextEditingController get phoneController => _phoneController;

  TextEditingController get websiteController => _websiteController;

  TextEditingController get typeController => _typeController;

  TextEditingController get aboutUzController => _aboutUzController;

  TextEditingController get aboutEnController => _aboutEnController;

  TextEditingController get aboutRuController => _aboutRuController;

  GlobalKey<FormState> get formKey => _formKey;

  TextEditingController get nameController => _nameController;

  String get city => _city;

  List<String> get imageList => _imageList;

  TextEditingController get mapLinkController => _mapLinkController;
}
