import 'package:flutter/cupertino.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/cubit/home_cubit/home_cubit.dart';

import 'package:mobileapp/models/business_account_model.dart';
import 'package:mobileapp/models/git_model.dart' as git;
import 'package:mobileapp/services/business_account_service.dart';
import 'package:mobileapp/widgets/tiles/business_hotel_tile.dart';
import 'package:mobileapp/widgets/tiles/business_restaurant_tile.dart';

class ProfileAuthPage extends StatelessWidget {
  const ProfileAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (ctx, state) {
          HomeCubit cubit = ctx.watch();
          return _buildBody(cubit);
        },
      ),
    );
  }

  SingleChildScrollView _buildBody(HomeCubit cubit) {
    return SingleChildScrollView(
      child: FutureBuilder(
        future: BusinessAccountService().getServiceList(),
        builder: (ctx, AsyncSnapshot<BusinessAccountModel?> snap) {
          if (snap.hasData) {
            BusinessAccountModel model = snap.data!;
            return Column(
              children: [
                SizedBox(height: 140.h),
                // if git is not null, Git will be shown
                model.git != null ? _myGitListWidget(model) : const SizedBox(),

                // if hotel list is not null, hotel list will be shown
                model.hotels != null ? _showHotelList(model) : const SizedBox(),

                // if restaurant list is not null, restaurant list will be shown
                model.restaurants != null
                    ? _showRestaurants(model)
                    : const SizedBox()
              ],
            );
          } else if (snap.hasError) {
            Center(child: Text(LocaleKeys.personalInfo.tr()));
          }
          return const Center(child: CupertinoActivityIndicator());
        },
      ),
    );
  }

  ListView _showRestaurants(BusinessAccountModel model) {
    return ListView.builder(
        padding: MyEdgeInsets.symmetric(h: 15.0),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: model.restaurants!.length,
        itemBuilder: (ctx, index) {
          Restaurants restaurants = model.restaurants![index];
          return BusinessRestaurantTile(restaurant: restaurants);
        });
  }

  ListView _showHotelList(BusinessAccountModel model) {
    return ListView.builder(
        padding: MyEdgeInsets.symmetric(h: 15.0),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: model.hotels!.length,
        itemBuilder: (ctx, i) {
          Hotels hotel = model.hotels![i];
          return BusinessHotelTile(hotels: hotel);
        });
  }

  Widget _myGitListWidget(BusinessAccountModel model) {
    var gits = git.Git.fromJson(model.git!.toJson());
    return MyGitListWidget(git: gits).onClick(() {
      CustomNavigator.push(GitInfoPage(git: gits, isEditing: true));
    });
  }
}
