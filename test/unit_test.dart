import 'package:flutter_test/flutter_test.dart';
import 'package:mobileapp/services/auth_services.dart';

void main() async {
  test(
    "User singIn",
    () async {
      var signIn = await AuthServices.signIn("umida@gmail.com", "Umida7\$");
      expect(signIn, true);
    },
  );

  test(
    "User register test",
    () async {
      var result = await AuthServices.register(
        fullName: 'fullfsdfsName',
        email: 'emafscgfxdfscdssfil@fmsdf.ur',
        password: 'Pass2fdsfs421fas',
      );
      expect(result, true);
    },
  );
}
