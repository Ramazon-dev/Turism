class UserModel {
  String? _id;
  String? _fullName;
  String? _email;
  String? _password;
  String? _phone;

  UserModel(String fullName, String email, String password, String phone) {
    _fullName = fullName;
    _email = email;
    _password = password;
    _phone = phone;
  }

  UserModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _fullName = json['fullname'];
    _email = json['email'];
    _email = json['phone'];
  }

  Map<String, dynamic> toMap() => {
    'fullName' : _fullName,
    'email' : _email,
    'password' : _password,
    'phone' : _phone,
  };

  String get id => _id!;

  String get name => _fullName!;

  String get password => _password!;

  String get email => _email!;
}