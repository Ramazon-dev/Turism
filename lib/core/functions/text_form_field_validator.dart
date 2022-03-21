class FormValidator {
  static String? email(value) {
    if (value.isEmpty) {
      return "Please, Fill the field";
    } else if (!_validPattern(value, _emailPattern)) {
      return "Input valid email";
    }
    return null;
  }

  static String? password(value) {
    if (value.isEmpty) {
      return "Please, Fill the field";
    } else if (!_validPattern(value, _passwordPattern)) {
      return "Password is not safety";
    }
    return null;
  }

  static String? url(value) {
    if (value.isEmpty) {
      return "Please, Fill the field";
    } else if (!_validPattern(value, _urlPattern)) {
      return "Please, enter valid url";
    }
    return null;
  }

  static String? general(value) {
    if (value.isEmpty) {
      return "Please, Fill the field";
    } else if (value.length < 8) {
      return "Minimum 8 characters";
    }
    return null;
  }

  static String? phone(value) {
    if (value.isEmpty) {
      return "Please, Fill the field";
    } else if (value.length < 9) {
      return "required 9 numbers";
    }
    return null;
  }


  static String? multiLine(value) {
    if (value.isEmpty) {
      return "Please, Fill the field";
    } else if (value.length < 20) {
      return "Minimum 20 characters";
    }
    return null;
  }

   static String? isNotEmpty(value) {
    if (value.isEmpty) {
      return "Please, Fill the field";
    }
    return null;
  }



  static bool _validPattern(String value, String pattern) {
    return RegExp(pattern).hasMatch(value);
  }

  static const String _urlPattern = r"^(http[s]?:\\/\\/(www\\.)?|ftp:\\/\\/(www\\.)?|www\\.){1}([0-9A-Za-z-\\.@:%_\+~#=]+)+((\\.[a-zA-Z]{2,3})+)(/(.)*)?(\\?(.)*)?";

  static const String _emailPattern =
      r"^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$";

  static const String _passwordPattern =
      r"^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])[a-zA-Z0-9][a-zA-Z0-9!@#$%^&*.,]{7,17}$";
}
