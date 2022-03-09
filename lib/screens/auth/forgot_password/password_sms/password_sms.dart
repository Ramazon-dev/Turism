import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/screens/auth/forgot_password/create_new_password/create_new_password.dart';
import 'package:mobileapp/screens/auth/forgot_password/widgets/circular_icon.dart';
import 'package:mobileapp/screens/auth/forgot_password/widgets/text_widget.dart';
import 'package:mobileapp/widgets/buttons/elevated_button_widget.dart';
import 'package:mobileapp/widgets/top_bar/appbar_origin.dart';
import 'package:sms_autofill/sms_autofill.dart';

class PasswordSms extends StatelessWidget {
  PasswordSms({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String code = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarOrigin(
        text: 'Подтвердите Ваш элек. адрес',
        actions: const SizedBox(),
        actions2: const SizedBox(),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: getHeight(40),
                ),
                const CircularIcon(
                  svgicon: 'assets/icons/message.svg',
                ),
                SizedBox(
                  height: getHeight(30),
                ),
                TextWidgetPassword(
                  text:
                      "Ваш новый пароль должен отличаться от ранее использовавшегося пароля.",
                ),
                SizedBox(
                  height: getHeight(30),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70),
                  child: PinFieldAutoFill(
                    codeLength: 4,
                    // autoFocus: true,
                    controller: emailController,
                    decoration: const BoxLooseDecoration(
                      strokeColorBuilder: FixedColorBuilder(
                        Colors.blue,
                      ),
                      radius: Radius.circular(10),
                    ),
                    currentCode: code,
                    onCodeSubmitted: (code) {},
                    onCodeChanged: (code) async {
                      if (code!.length == 4) {
                        // FocusScope.of(context).requestFocus(FocusNode());
                        // final result = await logic.passCodeConfirm(passcodeToken);
                        // if (result) {
                        //   Get.offAllNamed(Routes.main);
                        // } else {
                        //   Get.snackbar('error'.tr, result.toString());
                        // }
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: getHeight(200),
                ),
                ElevatedButtonWidget(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateNewPassword(),
                        ),
                      );
                    }
                  },
                  label: 'Сохранить',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
