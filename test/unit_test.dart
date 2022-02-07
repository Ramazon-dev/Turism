import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobileapp/services/auth_services.dart';

void main() async {
  test(
    "User singIn test",
    () async {
      var signIn = await AuthServices.signIn("umida@gmail.com", "Umida7\$");
      expect(signIn, true);
    },
  );

  test(
    "User singUp test",
    () async {
      var signUp =
          await AuthServices.signUpWithHttp('fullfsdfsName', 'emafssfil@fmsdf.ur', 'Pass2fdsfs421fas');
      expect(signUp, true);
    },
  );
}
