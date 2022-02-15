import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/cubit/profile_cubit/profile_cubit.dart';
import 'package:mobileapp/screens/auth/sign_in/sign_in_page.dart';
<<<<<<< HEAD
import 'package:mobileapp/services/image_pick_service.dart';
=======
import 'package:mobileapp/screens/profile/auth_profile_page.dart';
>>>>>>> 4902097d0ae3e20b500a086c11fe3145f772ed26
import 'package:mobileapp/widgets/elevated_button_widget.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  final String token = GetStorage().read('token') ?? '';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (_) => ProfileCubit(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          ProfileCubit cubit = context.watch();
<<<<<<< HEAD
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButtonWidget(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignInPage(),
                    ),
                  );
                },
                label: "Sign In Page too",
              ),
              SizedBox(height: 16),
              ElevatedButtonWidget(
                onPressed: () {
                  choose();
                },
                label: "choose image",
              )
            ],
          );
=======
          return token.isNotEmpty ? const ProfileAuthPage(): _unAuthBody(context);
>>>>>>> 4902097d0ae3e20b500a086c11fe3145f772ed26
        },
      ),
    );
  }



  Column _unAuthBody(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButtonWidget(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileAuthPage(),
                  ),
                );
              },
              label: "Sign In Page",
            ),
            ElevatedButtonWidget(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignInPage(),
                  ),
                );
              },
              label: "My Sign In Page",
            )
          ],
        );
  }
}
