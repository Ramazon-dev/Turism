import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class AuthTextWidget extends StatelessWidget {
  const AuthTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Text(
      'Войдите в свой аккаунт',
      style: TextStyle(
        color: AppColors.primary,
        fontSize: getHeight(40),
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
