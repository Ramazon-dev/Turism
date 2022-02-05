import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mobileapp/translations/locale_keys.g.dart';
class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(LocaleKeys.start.tr()),
    );
  }
}
