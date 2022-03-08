import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';

class LinkWithIconButton extends StatelessWidget {
  final String icon;
  final String label;
  final String link;

  const LinkWithIconButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.link,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon),
        SizedBox(width: 15.w),
        Text(
          label,
          maxLines: 1,
          style: AppTextStyle.medium(size: 12.0, color: AppColors.grey),
        ),
      ],
    ).onClick(() async{
      await launch(link);
    });
  }
}
