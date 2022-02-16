import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/translations/locale_keys.g.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    Locale currentLocale = context.locale;
    print(currentLocale);
    return Scaffold(
      appBar: SimpleAppBar(title: LocaleKeys.settings.tr()),
      body: Padding(
        padding: MyEdgeInsets.all(30.0),
        child: Column(
          children: [
            Text(LocaleKeys.start.tr()),
            ListView.builder(
                padding: MyEdgeInsets.only(top: 40.0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _locales().length,
                itemBuilder: (ctx, i) {
                  Map<String, dynamic> locale = _locales()[i];
                  return Padding(
                    padding: MyEdgeInsets.symmetric(v: 12.5),
                    child: InkWell(
                      onTap: () async {
                        await context.setLocale(locale['locale']);
                        setState(() {});
                      },
                      child: Material(
                        borderRadius: MyBorderRadius.circular(),
                        color: currentLocale == locale['locale']
                            ? AppColors.primary
                            : AppColors.lightGrey,
                        child: SizedBox(
                          height: 60.0.h,
                          child: Center(
                            child: Text(
                              locale['title'],
                              style: TextWidget.medium(
                                size: 20.0,
                                color: locale['locale'] == currentLocale
                                    ? AppColors.white
                                    : AppColors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }

  Container _buildContainer(Locale currentLocale, Map<String, dynamic> locale) {
    return Container(
      height: 60.0.h,
      width: 375.0.w,
      alignment: Alignment.center,
      decoration: MyDecoration.circular(
        color: currentLocale == locale['locale']
            ? AppColors.primary
            : AppColors.lightGrey,
      ),
      child: Text(
        locale['title'],
        style: TextWidget.medium(
          size: 20.0,
          color: locale['locale'] == currentLocale
              ? AppColors.white
              : AppColors.grey,
        ),
      ),
    );
  }

  List<Map<String, dynamic>> _locales() => [
        {
          "title": "Uzbek",
          "locale": const Locale('uz', 'UZ'),
        },
        {
          "title": "English",
          "locale": const Locale('en', 'GB'),
        },
        {
          "title": "Russian",
          "locale": const Locale('ru', 'RU'),
        },
      ];
}
