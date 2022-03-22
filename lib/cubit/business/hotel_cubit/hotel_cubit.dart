import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/screens/profile/auth_profile_page.dart';

part 'hotel_state.dart';

class HotelCubit extends Cubit<HotelState> {
  HotelCubit() : super(HotelInitial());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();
  final TextEditingController _mapLinkController = TextEditingController();
  final TextEditingController _aboutUzController = TextEditingController();
  final TextEditingController _aboutEnController = TextEditingController();
  final TextEditingController _aboutRuController = TextEditingController();
  List<String> _imageList = [];

  String _city = LocaleKeys.tashkent.tr();
  String _chosenCity = CityList().getCity(LocaleKeys.tashkent.tr());

  bool _isEditing = false;
  late String _hotelId;
  String toastMessage = '';

  HotelCubit.editing(Hotel hotel) : super(HotelInitial()) {
    _hotelId = hotel.id;
    _isEditing = true;
    _nameController.text = hotel.name;
    _phoneController.text = hotel.tell![0];
    _websiteController.text = hotel.site.toString();
    _mapLinkController.text = hotel.karta;
    _aboutUzController.text = hotel.informUz;
    _aboutEnController.text = hotel.informEn;
    _aboutRuController.text = hotel.informRu;
    _imageList = hotel.media;
    _city = CityList().getCityName(hotel.city!);
  }

  void cityChanged(dynamic value) {
    _city = value;
    _chosenCity = CityList().getCity(_city);
    emit(HotelInitial());
  }

//TODO:

  void setImage() {
    ImageChooser.chooseImage();
    _imageList = ImageChooser.imageList;
    print(_imageList);
    emit(HotelInitial());
  }

  void onDropdownMenuItemPressed() {}

  Future<void> onSavePressed() async {
    if (_formKey.currentState!.validate()) {
      emit(HotelLoading());
      String name = _nameController.text.trim();
      String phone = _phoneController.text.trim();
      String link = _websiteController.text.trim();
      String map = _mapLinkController.text.trim();
      String aboutUz = _aboutUzController.text.trim();
      String aboutEn = _aboutEnController.text.trim();
      String aboutRu = _aboutRuController.text.trim();

      Hotel hotel = Hotel(
        name: name,
        city: _chosenCity.toLowerCase(),
        informEn: aboutEn,
        informUz: aboutUz,
        informRu: aboutRu,
        karta: map,
        site: link,
        tell: [phone],
        media: ImageChooser.imageList,
      );
      if (_isEditing) {
        // if hotel is updating
        HotelService().updateHotelData(hotel).then((value) {
          if (value != null) {
            Fluttertoast.showToast(msg: 'Updated');
            CustomNavigator().pushAndRemoveUntil(const HomeScreen());
          } else {
            Fluttertoast.showToast(msg: value.toString());
          }
        });
      } else {
        // Else
        await HotelService.createNewHotel(hotel).then((value) {
          print(value);
          emit(HotelInitial());
          if (value == 201) {
            emit(HotelSucces());

            
            CustomNavigator().pushAndRemoveUntil(const ProfileAuthPage());
          } else {
            toastMessage = value.toString();
            emit(HotelError());
          }
          emit(HotelInitial());
        });
      }
    }
  }

  TextEditingController get nameController => _nameController;

  TextEditingController get phoneController => _phoneController;

  TextEditingController get websiteController => _websiteController;

  TextEditingController get aboutUzController => _aboutUzController;

  TextEditingController get aboutEnController => _aboutEnController;

  TextEditingController get aboutRuController => _aboutRuController;

  GlobalKey<FormState> get formKey => _formKey;

  String get city => _city;

  TextEditingController get mapLinkController => _mapLinkController;

  List<String> get imageList => _imageList;
}
