import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/core/functions/text_form_field_validator.dart';
import 'package:mobileapp/screens/auth/forgot_password/password_sms/password_sms.dart';
import 'package:mobileapp/screens/auth/forgot_password/widgets/circular_icon.dart';
import 'package:mobileapp/screens/auth/forgot_password/widgets/text_widget.dart';
import 'package:mobileapp/widgets/elevated_button_widget.dart';
import 'package:mobileapp/widgets/top_bar/appbar_origin.dart';

class CreateNewPassword extends StatelessWidget {
  CreateNewPassword({Key? key}) : super(key: key);
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarOrigin(
        text: 'Забыл пароль? ',
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
                  svgicon: 'assets/icons/key.svg',
                ),
                SizedBox(
                  height: getHeight(30),
                ),
                TextWidgetPassword(
                  text:
                      "Ваш новый пароль должен отличаться от ранее использовавшегося пароля.",
                ),
                SizedBox(height: getHeight(30)),
                TextFormFieldWidget(
                  controller: passwordController,
                  hint: 'Новый пароль',
                  // obscureText: true,
                  validator: FormValidator.password,
                ),
                SizedBox(height: getHeight(24)),
                TextFormFieldWidget(
                  controller: confirmPasswordController,
                  hint: 'Подтвердите пароль',
                  // obscureText: true,
                  validator: FormValidator.password,
                ),
                SizedBox(
                  height: getHeight(110),
                ),
                ElevatedButtonWidget(
                  onPressed: () {
                    if (passwordController.text ==
                        confirmPasswordController.text) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
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
