import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/core/functions/text_form_field_validator.dart';
import 'package:mobileapp/cubit/auth/sign_in_cubit/sign_in_cubit.dart';
import 'package:mobileapp/screens/auth/forgot_password/forgot_password/forgot_password.dart';
import 'package:mobileapp/screens/auth/sing_up/sign_up_page.dart';
import 'package:mobileapp/screens/auth/widgets/text_widget.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (_) => SignInCubit(),
      child: BlocBuilder<SignInCubit, SignInState>(builder: (ctx, state) {
        SignInCubit cubit = ctx.watch();
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: MyEdgeInsets.symmetric(h: 30.0, v: 20.0),
          child: Form(
            key: cubit.formKey,
            child: Column(
              children: [
                SizedBox(height: 80.h),
                AuthTextWidget(),
                MySizedBox(height: 80.0),
                TextFormFieldWidget(
                  controller: cubit.loginController,
                  hint: 'Email',
                  inputType: TextInputType.emailAddress,
                  validator: FormValidator.email,
                ),
                MySizedBox(height: 25.0),
                TextFormFieldWidget(
                  controller: cubit.passwordController,
                  hint: 'Password',
                  validator: FormValidator.general,
                  action: TextInputAction.done,
                ),
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text("Remember me"),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: cubit.isTrue,
                  onChanged: cubit.onChanged,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: getHeight(104),
                        left: getWidth(20),
                      ),
                      child: TextButton(
                        child: const Text(
                          "Забыл пароль? ",
                          style: TextStyle(color: AppColors.blue),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgotPassword(),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: getHeight(100),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.blue,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextButton(
                        child: Text(
                          LocaleKeys.signUp.tr(),
                          style:const TextStyle(color: AppColors.blue),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>const SignUpPage(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: getHeight(60)),
                ElevatedButtonWidget(
                  onPressed: cubit.onPressed,
                  label: LocaleKeys.signIn.tr(),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
