import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class LinkWithIconButton extends StatelessWidget {
  const LinkWithIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: () {},
        icon: SvgPicture.asset(AppIcons.email),
        label: Text('link'));
  }
}
