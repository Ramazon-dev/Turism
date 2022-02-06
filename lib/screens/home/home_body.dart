import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mobileapp/screens/auth/sign_in/sign_in_page.dart';
import 'package:mobileapp/translations/locale_keys.g.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/widgets/appbar_widget.dart';
import 'package:mobileapp/widgets/drawer_widget.dart';
import 'package:mobileapp/widgets/elevated_button_widget.dart';
import 'package:mobileapp/widgets/url_icon_widget.dart';
import 'package:mobileapp/widgets/url_text_widgte.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        UrlTextWidget(
          url: 'https://github.com/Ramazon-dev/',
          text: 'GitHub linki',
        ),
        UrlIconWidget(
          icon: SvgPicture.asset(
            AppIcons.email,
            fit: BoxFit.scaleDown,
          ),
          url: 'https://t.me/Ramazon1681',
        ),
        const Center(
          child: Text("Home Page"),
        ),
        InkWell(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignInPage())),
          child: ElevatedButtonWidget(
            text: 'button',
          ),
        ),
      ],
    );
  }
}
