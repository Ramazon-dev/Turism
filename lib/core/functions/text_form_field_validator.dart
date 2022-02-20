class FormValidator {
  static String? email(value) {
    if (value.isEmpty) {
      return "Please, Fill the field";
    } else if (!_validPattern(value, _emailPattern)) {
      return "Input valid email";
    }
  }

  static String? password(value) {
    if (value.isEmpty) {
      return "Please, Fill the field";
    } else if (!_validPattern(value, _passwordPattern)) {
      return "Password is not safety";
    }
  }

  static String? general(value) {
    if (value.isEmpty) {
      return "Please, Fill the field";
    } else if (value.length < 8) {
      return "Minimum 8 characters";
    }
  }

  static String? phone(value) {
    if (value.isEmpty) {
      return "Please, Fill the field";
    } else if (value.length < 9) {
      return "required 9 numbers";
    }
  }
  static String? multiLine(value) {
    if (value.isEmpty) {
      return "Please, Fill the field";
    } else if (value.length < 80) {
      return "Minimum 80 characters";
    }
  }

   static String? isNotEmpty(value) {
    if (value.isEmpty) {
      return "Please, Fill the field";
    } else if (value.length < 8) {
      return "Minimum 8 characters";
    }
  }



  static bool _validPattern(String value, String pattern) {
    return RegExp(pattern).hasMatch(value);
  }

  static const String _emailPattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";

  static const String _passwordPattern =
      r"/^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])[a-zA-Z0-9][a-zA-Z0-9!@#$%^&*.,]{7,17}$/";
}
