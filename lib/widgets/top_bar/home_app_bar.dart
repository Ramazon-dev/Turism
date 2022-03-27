import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/models/locale_model.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  final ValueChanged<dynamic> onLanguageChanged;
  final VoidCallback onDrawerPressed;
  const HomeAppBar({Key? key, required this.onLanguageChanged, required this.onDrawerPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      leading: IconButton(
        onPressed:onDrawerPressed,
        icon: const Icon(Icons.menu),
      ),
      actions: [
        PopupMenuButton(
          onSelected: onLanguageChanged,
            icon: SvgPicture.asset(AppIcons.language),
            itemBuilder: (_) {
          return LocaleData.localeList.map((e) => _showLocale(e, context)).toList();
        })
      ],
    );
  }

  PopupMenuItem _showLocale(LocaleModel model, BuildContext context) => PopupMenuItem(
      value: model.locale,
      child: Row(
        children: [
          SvgPicture.asset(model.flag),
          SizedBox(width: 12.w),
          Text(model.name),
          const Spacer(),
          Visibility(
              visible: context.locale.languageCode == model.locale.languageCode,
              child:const Icon(Icons.check, color: AppColors.primary))
        ],
      ));

  void _onSelected(v) {

  }

  @override
  Size get preferredSize => Size(double.infinity, 80.h);
}
