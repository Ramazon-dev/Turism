import 'package:mobileapp/models/user_model.dart';

class UserData {
  static UserModel? _currentUser;

  static UserModel get currentUser => _currentUser!;

  static set setCurrentUser(UserModel value) {
    _currentUser = value;
  }
}