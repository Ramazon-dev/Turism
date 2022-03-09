import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/cubit/auth/sign_up_cubit/sign_up_cubit.dart';
import 'package:mobileapp/screens/auth/forgot_password/password_sms/password_sms.dart';
import 'package:mobileapp/screens/auth/forgot_password/widgets/circular_icon.dart';
import 'package:mobileapp/screens/auth/forgot_password/widgets/text_widget.dart';
import 'package:mobileapp/widgets/top_bar/appbar_origin.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                key: cubit.formKey,
                child: Padding(
                  padding: MyEdgeInsets.symmetric(h: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: getHeight(40),
                      ),
                      const CircularIcon(),
                      MySizedBox(
                        height: 30.0,
                      ),
                      TextWidgetPassword(
                        text:
                            "Введите свой адрес электронной почты, чтобы получить код подтверждения.",
                      ),
                      MySizedBox(
                        height: 30.0,
                      ),
                      TextFormFieldWidget(
                        controller: emailController,
                        hint: 'Адрес электронной почты',
                        // inputType: TextInputType.emailAddress,
                        // validator: FormValidator.email,
                        action: TextInputAction.done,
                        // obscureText: true,
                      ),
                      MySizedBox(
                        height: 190.0,
                      ),
                      ElevatedButtonWidget(
                        onPressed: () {
                          CustomNavigator.push(PasswordSms());
                          // if (formKey.currentState!.validate()) {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => PasswordSms(),
                          //     ),
                          //   );
                          // }
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
