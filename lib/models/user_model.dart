class UserModel {
  String? _id;
  String? _fullName;
  String? _email;
  String? _password;

  UserModel(String fullName, String email, String password) {
    _fullName = fullName;
    _email = email;
    _password = password;
  }

  UserModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _fullName = json['fullname'];
    _email = json['email'];
  }

  Map<String, dynamic> toMap() => {
    'fullName' : _fullName,
    'email' : _email,
    'password' : _password,
  };

  String get id => _id!;

  String get name => _fullName!;

  String get password => _password!;

  String get email => _email!;
}