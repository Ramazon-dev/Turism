import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/screens/on_boarding/on_boarding_page.dart';
import 'package:mobileapp/screens/settings/choose_language_page.dart';
import 'package:mobileapp/translations/locale_keys.g.dart';
import 'package:mobileapp/widgets/lets_go.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        decoration: MyDecoration.assetImage(assetImage: AppImages.initial),
        child: Column(
          children: [
            LetsGo(text: LocaleKeys.welcome.tr(), color: AppColors.black),
            const Spacer(),
            OutlinedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const ChooseLanguagePage()));
              },
              child: Text(
                LocaleKeys.start.tr(),
                style: AppTextStyle.regular(
                  color: AppColors.white,
                  size: 20.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  padding: MyEdgeInsets.symmetric(h: 109.0, v: 17.0),
                  primary: AppColors.white.withOpacity(0.15),
                  side: const BorderSide(color: AppColors.white)),
            ),
            MySizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}
