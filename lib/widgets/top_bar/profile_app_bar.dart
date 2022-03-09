import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/cubit/home_cubit/home_cubit.dart';
import 'package:mobileapp/screens/business_profile/hotel/input_hotel_page.dart';
import 'package:mobileapp/screens/business_profile/restaurant/restaurant_page.dart';
import 'package:mobileapp/widgets/cards/profile_info_card.dart';

class ProfileAppBar extends StatelessWidget with PreferredSizeWidget {
  HomeCubit? cubit;

  ProfileAppBar({Key? key, this.cubit}) : super(key: key);

  final UserModel _user = UserModel.fromJson(GetStorage().read('user'));

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          alignment: const Alignment(0.0, -0.6),
          height: 274.h,
          decoration: BoxDecoration(
            gradient: AppColors.linearGradient,
            borderRadius:
                MyBorderRadius.only(bottomLeft: 32.0, bottomRight: 32.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.canPop(context)
                      ? Navigator.pop(context)
                      : cubit!.openDrawer.call();
                },
                icon: SvgPicture.asset(
                  Navigator.canPop(context)
                      ? AppIcons.arrowBack
                      : AppIcons.menu,
                ),
              ),
              MySizedBox(width: 110.0),
              Text(
                LocaleKeys.profile.tr(),
                style: AppTextStyle.medium(color: AppColors.white, size: 18.0),
              ),
              const Spacer(),
              _popUpButton(),
            ],
          ),
        ),
        Positioned(
            bottom: -120.h,
            right: 72.w,
            left: 72.w,
            child: ProfileInfoCard(user: _user))
      ],
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
              CustomNavigator.push(GitInfoPage());
              break;
            case 'hotel':
              CustomNavigator.push(InputHotelPage(isEditing: false));
              break;
            case 'restaurant':
              CustomNavigator.push(RestaurantPage());
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
    PopupMenuItem(value: 'git', child: Text(LocaleKeys.git.tr())),
    PopupMenuItem(value: 'hotel', child: Text(LocaleKeys.hotel.tr())),
    PopupMenuItem(value: 'restaurant', child: Text(LocaleKeys.restaurant.tr())),
  ];

  @override
  Size get preferredSize => Size(double.infinity, 274.h);
}
