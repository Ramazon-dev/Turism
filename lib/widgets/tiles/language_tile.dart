import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/models/locale_model.dart';
import 'package:mobileapp/screens/on_boarding/on_boarding_page.dart';
import 'package:mobileapp/services/locale_service.dart';

class LanguageTile extends StatelessWidget {
  final LocaleModel locale;

  const LanguageTile({Key? key, required this.locale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomNavigator().init(context);
    return Card(
      margin: MyEdgeInsets.symmetric(h: 20.0, v: 8.0),
      child: ListTile(
        onTap: () async {
          await context.setLocale(locale.locale);
          await LocaleService.setLocale(locale.locale.languageCode);
          CustomNavigator().pushAndRemoveUntil(const OnBoardingPage());
        },
        leading: SvgPicture.asset(locale.flag, width: 40.w),
        title: Text(locale.nativeName),
        subtitle: Text(locale.name),
      ),
    );
  }
}
