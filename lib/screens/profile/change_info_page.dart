import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/cubit/profile_cubit/profile_cubit.dart';
import 'package:mobileapp/widgets/inputs/underlined_field.dart';

class ChangingProfilePage extends StatelessWidget {
  const ChangingProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (ctx, state) {
          ProfileCubit cubit = ctx.watch();
          return _buildScaffold(cubit);
        },
      ),
    );
  }

  Scaffold _buildScaffold(ProfileCubit cubit) {
    return Scaffold(
      appBar: ProfileAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 538.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 37.w, vertical: 54.h),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      UnderlinedInputField(hint: 'Name', suffix: _suffix()),
                      MySizedBox(height: 12.0),
                      UnderlinedInputField(hint: 'Email', suffix: _suffix()),
                      const Spacer(),
                      ElevatedButtonWidget(
                          onPressed: () {}, label: 'Сохранить'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SvgPicture _suffix() => SvgPicture.asset(AppIcons.edit, fit: BoxFit.none);
}
