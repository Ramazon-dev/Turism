import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/screens/business_profile/git_info_page.dart';
import 'package:mobileapp/screens/business_profile/input_hotel_page.dart';

class ProfileAppBar extends StatelessWidget {
  double height;

  ProfileAppBar({Key? key, this.height = 152.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: const Alignment(0.0, -0.6),
      height: getHeight(height),
      decoration: BoxDecoration(
        gradient: AppColors.linearGradient,
        borderRadius: MyBorderRadius.only(bottomLeft: 32.0, bottomRight: 32.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(AppIcons.arrowBackWhite),
          ),
          MySizedBox(width: 110.0),
          Text(
            'Profile',
            style: TextWidget.medium(color: AppColors.white, size: 18.0),
          ),
          const Spacer(),
          _popUpButton(),
        ],
      ),
    );
  }

  Container _popUpButton() {
    return Container(
      margin: MyEdgeInsets.symmetric(h: 20.0),
      alignment: Alignment.center,
      height: getHeight(38.0),
      width: getWidth(68.0),
      decoration: MyDecoration.circular(
        color: AppColors.white,
        radius: 32.0,
      ),
      child: PopupMenuButton(
        onSelected: (v) {
          switch (v) {
            case 'git':
              CustomNavigator().push(const GitInfoPage());
              break;

            case 'hotel':
              CustomNavigator().push(const InputHotelPage());
              break;
            case 'restaurant':
              CustomNavigator().push(const GitInfoPage());
              break;
          }
        },
        offset: Offset(0.0, getHeight(53.0)),
        child: const Text('Бизнес аккаунт', textAlign: TextAlign.center),
        itemBuilder: (v) => _list,
      ),
    );
  }

  final List<PopupMenuItem> _list = [
    const PopupMenuItem(value: 'git', child: Text("Гит.")),
    const PopupMenuItem(value: 'hotel', child: Text("Отель.")),
    const PopupMenuItem(value: 'restaurant', child: Text("Ресторан.")),
  ];
}
