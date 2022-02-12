import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/core/functions/text_form_field_validator.dart';
import 'package:mobileapp/cubit/auth/sign_up_cubit/sign_up_cubit.dart';
import 'package:mobileapp/screens/auth/forgot_password/password_sms/password_sms.dart';
import 'package:mobileapp/screens/auth/forgot_password/widgets/circular_icon.dart';
import 'package:mobileapp/screens/auth/forgot_password/widgets/text_widget.dart';
import 'package:mobileapp/widgets/elevated_button_widget.dart';
import 'package:mobileapp/widgets/top_bar/appbar_origin.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignUpCubit(),
      child: BlocBuilder<SignUpCubit, SignUpState>(
        builder: (ctx, state) {
          SignUpCubit cubit = ctx.watch();
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
                      const CircularIcon(),
                      SizedBox(
                        height: getHeight(30),
                      ),
                      TextWidgetPassword(
                        text:
                            "Введите свой адрес электронной почты, чтобы получить код подтверждения.",
                      ),
                      SizedBox(
                        height: getHeight(30),
                      ),
                      TextFormFieldWidget(
                        controller: cubit.emailController,
                        hint: 'Адрес электронной почты',
                        inputType: TextInputType.emailAddress,
                        validator: FormValidator.email,
                        // obscureText: true,
                      ),
                      SizedBox(
                        height: getHeight(190),
                      ),
                      ElevatedButtonWidget(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PasswordSms(),
                              ),
                            );
                          }
                        },
                        label: 'Проверять',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
